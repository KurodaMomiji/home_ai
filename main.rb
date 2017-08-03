# myapp.rb
require 'rpi_gpio'
require_relative 'models/switch'
require_relative 'models/room'
require 'json'
require 'sequel'
# Set pin numbering system for GPIO
RPi::GPIO.set_numbering :bcm

# Initialize Objects
## Database

DB = Sequel.sqlite # memory database, requires sqlite3

# catch the exit signal (on ctrl+c), (ctrl+d - kill),
# then run clean_up
at_exit { RPi::GPIO.clean_up }

## old code
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

		5f self.find(name)
			@@room2s.select {|room| room.name == name}
		end
	end
end

# catch the exit signal (on ctrl+c), (ctrl+d - kill),
# then run clean_up
at_exit { RPi::GPIO.clean_up }
