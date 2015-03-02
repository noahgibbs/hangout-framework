require "rack"

class Options < Hash
  attr_writer :options	
end
options = Options.new
options.store(:app, lambda {|e| [200, {}, ['hello world']]})
options.store(:server, 'webrick')
options.store(:Port, 3000)
options.store(:Host, "0.0.0.0")

p options
p options.instance_variables

#Rack::Server.start(options hash of variables)

rb = Rack::Builder.new
rb.use Rack::ContentType

Rack::Server.start  options