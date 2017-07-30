require_relative 'main'
require 'sinatra'

# Web Configuration
set :port, 3000
set :bind, '0.0.0.0'

puts ENV.inspect

# Actions

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
