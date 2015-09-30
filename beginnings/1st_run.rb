
require "rack"

app = Rack::Builder.new do
  run proc {[200, {"Content-Type" => "text/html"}, ["Hello, World"]]}
end

options = {app: app, server: 'webrick', Port: 9393, Host: "0.0.0.0"}
Rack::Server.start options

# http://localhost:9393
# my runner for fist code list without rewritting the config.ru and to play with options hash as well.
# see : https://www.youtube.com/watch?v=evDJMLb1d28
