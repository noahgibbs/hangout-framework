app = Rack::Builder.app do
  use Rack::CommonLogger
  use Rack::ContentType
  run lambda { |env| [200, {}, ['OK']] }
end

run app