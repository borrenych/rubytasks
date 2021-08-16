require 'thin'
require_relative 'time_logging_middleware'
require_relative 'weather_middleware'
#require_relative 'server'
require 'rack'
require_relative 'app'


use TimeLoggingMiddleware
use WeatherMiddleware
run TestApp.new
# TODO: 1) create 1 or 2 middlewares for app; 2) move app class and middlewares to separated files
