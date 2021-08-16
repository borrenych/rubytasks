require 'rack'
require 'thin'

module Application
  class Base
    attr_reader :routes, :request

    def initialize
      @routes = {}
    end

    def get(path, &handler)
      route('GET', path, &handler)
    end

    def post(path, &handler)
      route('POST', path, &handler)
    end

    def patch(path, &handler)
      route("PATCH", path, &handler)
    end

    def delete(path, &handler)
      route("DELETE", path, &handler)
    end



    def call(env)
      @request = Rack::Request.new(env)
      method = @request.request_method
      path = @request.path_info

      handler = @routes
                  .fetch(method, {})
                  .fetch(path, nil)
      if handler
        instance_eval(&handler)
      else
        [
          404,
          {},
          ["Undefined route #{path} for #{method}"]
        ]
      end
    end

    private

    def route(method, path, &handler)
      @routes[method] ||= {}
      @routes[method][path] = handler
    end

    def params
      @request.params
    end
  end
end

our_app = Application::Base.new

our_app.get '/hello' do
  [200, {}, ["Our params: #{params}"]]
end

our_app.get '/hello/1' do
  [200, {}, ["need to delete"]]
end


our_app.post '/' do
    # TODO: try to represent body
    [200, {}, request.body]
end

our_app.delete '/hello/1' do
  [200, {}, ]
end


# TODO: add couple of patch, delete request
# TODO: move your app to sinatra framework (example.rb)

Rack::Handler::Thin.run(our_app)
