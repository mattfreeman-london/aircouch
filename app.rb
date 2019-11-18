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

  get '/listings/new' do
    erb :new_listing
  end

  post '/listings/new' do
    Listing.create(name: params[:name], description: params[:description], price: params[:price], available_date: params[:available_date])
    redirect '/listings'
  end

  run! if app_file == $0
end
