app = Rack::Builder.app do
  use Rack::ContentType
  run lambda { |env| [200, {}, ['Hello, World']] }
end

run app
