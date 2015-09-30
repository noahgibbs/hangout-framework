```ruby
def output(text, options = {})
  [ options[:status] || 200, {}, [ text ].flatten ]
end

require "rack"

app = Rack::Builder.new do
  use Rack::ContentType
  run proc {output "Hello, World"}
end

options = {app: app, server: 'webrick', Port: 9393, Host: "0.0.0.0"}
Rack::Server.start options

```