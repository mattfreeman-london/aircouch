require 'sinatra/base'
require 'sinatra/flash'
require './lib/listing.rb'
require './lib/user.rb'

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

  get '/users/new' do
    erb :users_new
  end

  post '/users/new' do
    User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:name] = params[:name]
    redirect '/welcome'
  end

  get '/welcome' do
    @user = session[:name]
    erb :welcome
  end

  run! if app_file == $0
end
