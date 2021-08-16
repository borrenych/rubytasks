require 'rack'
require 'thin'
require_relative 'time_logging_middleware'
require_relative 'weather_middleware'

app = -> (env) do
  sleep(3)
  [
    200,
    { 'Content-Type' => 'text/html' },
    ['<h1>Hello</h1>']
  ]
end


Rack::Handler::Thin.run TimeLoggingMiddleware.new(WeatherMiddleware.new(app))
