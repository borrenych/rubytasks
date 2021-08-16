require_relative 'temperature_counter'


class WeatherMiddleware
  def initialize(app)
    @app = app
  end

 

  def call(env)
    status, header, body = @app.call(env)
    body << "Average temperature in St. Petersburg for the last week: #{temp_counter} &#176C.<br>"
    [status, header, body]
  end
end
