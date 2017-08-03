# myapp.rb
require 'json'
require 'rpi_gpio'
require_relative 'models/switch'
require_relative 'models/room'
require_relative 'database/db'

RPi::GPIO.set_numbering :bcm # Set pin numbering system for GPIO

# Initialize Objects

# catch the exit signal (on ctrl+c), (ctrl+d - kill),
# then run clean_up
at_exit { RPi::GPIO.clean_up }
