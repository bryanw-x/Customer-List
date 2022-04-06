require 'tty-prompt'

class CustomerList

  def initialize(file)
    @file = file
  end

  def run!
    if sorted_option_selected
      output_information(sort_output(sort_by, order_by))
    else
      output_information(output_data_file)
    end
  end

  private

  attr_reader :file

  def sorted_option_selected
    prompt.yes?('Would you like to sort by Full Name or Vehicle Type?')
  end

  def sort_by
    prompt.select("How would you like to sort?", ["Full Name", "Vehicle Type"])
  end

  def order_by
    prompt.select("ASC or DESC?", ["ASC", "DESC"])
  end

  def output_information(content)
    puts "#{headers.join(" | ")}"
    content.each do |row|
      puts "#{row[:first_name]} #{row[:last_name]} | #{row[:email]} | #{row[:vehicle_type]} | #{row[:vehicle_name]} | #{row[:vehicle_length]}"
    end
  end

  def output_data_file
    array_of_hashes = []
    file_content.each do |line|
      row = Hash[keys.zip(line.strip.split(delimited_by))]
      array_of_hashes << row
    end
    array_of_hashes
  end

  def sort_output(sort_by, order_by)
    if sort_by == 'Vehicle Type'
      value = output_data_file.sort_by { |a| a[:vehicle_type].downcase }
    else sort_by == 'Full Name'
      value = output_data_file.sort_by { |a| a[:last_name] }
    end
    order_by == 'DESC' ?  value.reverse : value
  end

  def prompt
    TTY::Prompt.new
  end

  def headers
    ["Full Name", "Email", "Vehicle Type", "Vehicle Name", "Vehicle Length"]
  end

  def file_content
    File.readlines(file)
  end

  def keys
    [:first_name, :last_name, :email, :vehicle_type, :vehicle_name, :vehicle_length]
  end

  def delimited_by
    file_content.grep(/,/).any? ? "," : "|"
  end
end

CustomerList.new("pipes.txt").run!
# CustomerList.new("commas.txt").run!
