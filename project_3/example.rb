require 'sinatra'


get "/" do
  "Hello from sinatra"
end


get '/index' do
  @songs = [{title: 'Charles Trenet, Le mer', url: "https://www.youtube.com/watch?v=qEkd1qWonj8"},
            {title: 'Edith Piaf, Non je ne regrette rien', url: "https://www.youtube.com/watch?v=t6wjCcWC2aE"},
            {title: 'France Gall, Poupée de cire poupée de son', url: "https://www.youtube.com/watch?v=rRva0YOVtcI"},
            ]
  erb :default
end

post '/' do
  request.body
end

delete '/index' do
  
end

patch '/index' do
  
end