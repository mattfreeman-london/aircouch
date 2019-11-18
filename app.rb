require 'sinatra/base'
require 'sinatra/flash'
require './lib/listing.rb'

class AirCouch < Sinatra::Base
  enable :sessions
  set :session_secret, "secret"
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/listings' do
    @listings = Listing.all
    erb :listings
  end

  run! if app_file == $0
end
