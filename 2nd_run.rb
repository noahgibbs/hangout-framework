require "rack"

app = Rack::Builder.new do
	use Rack::ContentType
  run proc {[200, {}, ["Hello, World"]]}
end

options = {app: app, server: 'thin', Port: 9292, Host: "0.0.0.0"}
Rack::Server.start options
