use Rack::ContentType

def output(text, options = {})
  [ options[:status] || 200,
    {}, [ text ].flatten ]
end

run proc { |env|
  path = env['PATH_INFO']
  if path =~ %r{^/foo}
    output "Hello, foo!"
  else
    output "Not found!", :status => 400
  end
}
