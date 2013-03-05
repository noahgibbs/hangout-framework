require "erubis"

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
