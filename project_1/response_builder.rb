# localhost:5678/other.html

require_relative 'response'

class ResponseBuilder
  def build_response(request:)
    if request[:path] == '/'
      respond_with('views' + '/index.html')
    else
      respond_with('views' + request[:path])
    end
  end

  def respond_with(path_to_file)
    if File.exists?(path_to_file)
      Response.new(
        code: 200,
        data: File.binread(path_to_file)
      )
    else
      Response.new(
        code: 404
      )
    end
    # TODO: add ability to return Response.new(code: 404) if path to file was not found
  end
end
