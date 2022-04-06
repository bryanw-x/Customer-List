# Outdoor.sy Customer List

Outdoor.sy Customer List is a tool that takes customer lists and return the data in different sorted orders.

TTY::Prompt is a gem that provides independent prompt component for TTY toolkit.

## Installation

First, in the 'project' directory, you can open up the 'customer_list.rb' file where all the code has been created. Next, you can install the necessary gem files by running in your Terminal to install TTY::Prompt.:

```bash
gem install tty
gem install tty-prompt
```

## Usage

```ruby
require 'tty-prompt'

# prompt.yes?
def confirm_selections
  prompt = TTY::Prompt.new
prompt.yes?("Would you like to continue with the items that you have selected?")
end
confirm_selections
```

## Notes:
Files included in the folder are 'pipes.txt' and 'commas.txt'. After installing TTY::Prompt gem, you can run the following command to fire up the application: 
```bash
ruby customer_list.rb
```

The below commands will run the "pipes.txt" file by default, with the command that runs "commas.txt" commented out. This can change as necessary. 

```ruby
CustomerList.new("pipes.txt").run!
# CustomerList.new("commas.txt").run!
```
