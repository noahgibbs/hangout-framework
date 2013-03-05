use Rack::ContentType

run proc {
  [ 200, {},
    [ "Hello, World." ] ]
}
