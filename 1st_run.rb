# Is this cryptic enough?
# we make our own hash class called Options
class Options < Hash
  attr_writer :options	
end

options = Options.new
# store what ever we want or need in the hash. see rack/server.rb for more info
options.store(:app, lambda {|e| [200, {'Content-Type' => 'text/html'}, ['hello world']]})
options.store(:server, 'webrick')
options.store(:Port, 3000)
options.store(:Host, "0.0.0.0")
p options
# never had to make one instance variable either even though we have the attribute options.
p options.instance_variables

#Rack::Server.start(options hash of variables)
require "rack"

Rack::Server.start  options

# http://localhost:3000
# my runner for fist code list without rewritting the config.ru and to play with options hash as well.
# see : https://www.youtube.com/watch?v=evDJMLb1d28