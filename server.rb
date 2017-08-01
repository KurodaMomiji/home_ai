require_relative 'main'
require 'sinatra'

# Web Configuration
set :port, 3000
set :bind, '0.0.0.0'

before do
  # content_type 'application/json'
  content_type 'text/plain'
end

# Actions
get '/rooms' do
    DB::Room.all.map {|room| "\n" + room.to_json}.join
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
