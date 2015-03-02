def output(text, options = {})
  [ options[:status] || 200, {}, [ text ].flatten ]
	end
	
class Options < Hash
  attr_writer :options	
end
options = Options.new
options.store(:app, lambda {|e| [200, {}, ['hello world']]})
options.store(:server, 'webrick')
options.store(:Port, 9292)
options.store(:Host, "0.0.0.0")
p options
p options.instance_variables

#Rack::Server.start(options hash of variables)
require "rack"
#Rack::ContentType
# nop. How may we do this from this type of runner if at all?
Rack::Server.start  options