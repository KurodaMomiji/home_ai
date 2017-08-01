# myapp.rb
require 'rpi_gpio'
require_relative 'models/switch'
require_relative 'models/room'
require 'json'

RPi::GPIO.set_numbering :bcm

# Initialize Objects
module DB
	class Room
			room = ::Room.new("Computer Room")
			room << Switch.new(17, "Red", false)
			room << Switch.new(27, "Green", false)
			room << Switch.new(22, "Blue", false)

			r2 = ::Room.new("2nd")
			r3 = ::Room.new("3rd")

			@@rooms = [room, r2, r3]

		def self.all
			@@rooms
		end
	end
end

# catch the exit signal (on ctrl+c), (ctrl+d - kill),
# then run clean_up
at_exit { RPi::GPIO.clean_up }
