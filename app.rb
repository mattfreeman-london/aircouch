require 'sinatra/base'
require 'sinatra/flash'

class AirCouch < Sinatra::Base
  enable :sessions
  set :session_secret, "secret"
  register Sinatra::Flash
  
  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end