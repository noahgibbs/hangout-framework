```ruby
require "rack"
require 'erubis'

class RubyHangout

  class << self
    def output(text, options = {})
      [ options[:status] || 200, {}, [ text ].flatten ]
    end

    def from_erb(file, vars = {})
      eruby = Erubis::Eruby.new File.read(file)
      output eruby.result vars
    end

    def call(env)
      path = env['PATH_INFO']
      if path =~ %r{^/run}
        from_erb "./template.html.erb"
      else
        output "Not found!", :status => 400
      end
    end
  end
end

use Rack::ContentType
run RubyHangout
p self


```