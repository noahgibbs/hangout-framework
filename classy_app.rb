
module Classy
  class App
    
    attr_accessor :status, :header, :body
    
    def initialize(status, header, body) 
      @status = status
      @header = header
      @body   = body
    end
    
    def call(env)
      [@status, @header, @body]
    end
    
  end
end

if __FILE__ == $PROGRAM_NAME
  require 'rack'
  status = 200
  header = {'content-type' => 'text/html'}
  body   = ['Hello from uwsgi NGINX proxy!']
  app = Classy::App.new(status, header, body)
  Rack::Handler::WEBrick.run app
end
