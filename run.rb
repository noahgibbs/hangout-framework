=begin
use Rack::ContentType

def output(text, options = {})
  [ options[:status] || 200,
    {}, [ text ].flatten ]
end

def from_erb(file, vars = {})
  eruby = Erubis::Eruby.new File.read(file)
  output eruby.result vars
end

run proc { |env|
  path = env['PATH_INFO']
  if path =~ %r{^/foo}
    from_erb "template.html.erb"
  else
    output "Not found!", :status => 400
  end
}

my rewrite
path = env['PATH_INFO']
:app => lambda { |env| env['PATH_INFO'] =~ %r{^/foo} ? from_erb(template) : output "Not found!", :status => 400 }
=end

template = File.open("template.html.erb").read
require 'erubis'
result = Erubis::Eruby.new(template).result
@body = [result]
@status = 200
@header = {}
@triplet = [@status, @header, @body]
@app = lambda do |e| 
  @triplet
end

class Options < Hash
  attr_writer :options	
end

options = Options.new
options.store(:app, @app)
options.store(:server, 'webrick')
options.store(:Port, 3000)
options.store(:Host, "0.0.0.0")
p options
p options.instance_variables

require "rack"

Rack::Server.start options