# myapp.rb
require 'sinatra'
require 'rpi_gpio'
require './switch'
require_relative 'room'

#DIR = "/home/pi/Desktop/RubyProjects/test_data/comics.txt"

set :port, 3000
set :bind, '0.0.0.0'

# Main
RPi::GPIO.set_numbering :bcm

s1 = Switch.new(17, "Red", false)
s2 = Switch.new(27, "Green", false)
s3 = Switch.new(22, "Blue", false)
room = Room.new("Computer Room", [s1, s2, s3])




room = Room.new("Computer Room")
room << Switch.new(17, "Red", false)
room << Switch.new(27, "Green", false)
room << Switch.new(22, "Blue", false)

# Pages
get '/' do
	'Hello world!'
end

get '/hello/:name' do
	# matches "GET /hello/foo" and "GET /hello/bar/"
	# params['name'] is 'foo' or 'bar'
	"Hello #{params['name']}!"
end

get '/hello/name/:blah' do |n|
	# matches "GET /hello/name/foo" and "GET /hello/name/bar"
	# params['blah'] is 'foo' or 'bar'
	# n store params['blah']
	"Wrong #{n}"
end
