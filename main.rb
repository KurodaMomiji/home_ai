# myapp.rb
require 'rpi_gpio'
require_relative 'models/switch'
require_relative 'models/room'


# Initialize Objects

RPi::GPIO.set_numbering :bcm

s1 = Switch.new(17, "Red", false)
s2 = Switch.new(27, "Green", false)
s3 = Switch.new(22, "Blue", false)
room = Room.new("Computer Room", [s1, s2, s3])

room = Room.new("Computer Room")
room << Switch.new(17, "Red", false)
room << Switch.new(27, "Green", false)
room << Switch.new(22, "Blue", false)
