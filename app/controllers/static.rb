
get '/' do
  erb :"static/index"
end

get '/error' do
  erb :"static/error"
end
