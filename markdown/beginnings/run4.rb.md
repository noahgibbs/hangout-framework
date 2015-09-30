```ruby
require 'erubis'

text = "<p> A template! </p><% 10.times do %><p> Pretty cool! </p><% end %>"
template = Erubis::Eruby.new(text).result

def output(text, options = {})
  [ options[:status] || 200, {}, [ text ].flatten ]
end

require "rack"

app = Rack::Builder.new do
  use Rack::ContentType
  run proc {output template}
end

options = {app: app, server: 'webrick', Port: 9393, Host: "0.0.0.0"}
Rack::Server.start options

# http://localhost:9393

```