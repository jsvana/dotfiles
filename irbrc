require 'awesome_print'
require 'irb/ext/save-history'

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

AwesomePrint.irb!

def clear
	puts `clear`
end
