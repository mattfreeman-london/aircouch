require 'sinatra/base'
require 'sinatra/flash'
require './lib/listing.rb'
require './lib/booking.rb'
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
    Listing.create(params[:name], params[:description], params[:price], params[:available_date])
    redirect '/listings'
  end

  get '/listings/:id' do
    @id = params["id"]
    erb :new_booking
  end

  post '/listings/:id/book' do
    @start_date = params["start_date"]
    @end_date = params["end_date"]
    @listing_id = params["id"]
    @guest_id = "1"
    new_booking = Booking.create(params["start_date"], params["end_date"], @guest_id, params["id"], 20)
    "Your Booking has been requested"
  end

  get '/users/new' do
    erb :users_new
  end

  post '/users/new' do
    user = User.create(name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/welcome'
  end

  get '/welcome' do
    @user = User.find(session[:user_id])
    erb :welcome
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    if ENV['RACK'] == 'test'
      connect = PG.connect(dbname: 'aircouch_test')
    else
      connect = PG.connect(dbname: 'aircouch')
    end
    result = connect.exec("SELECT * FROM users WHERE email = '#{params[:email]}'")
    user = User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
    session[:user_id] = user.id
    redirect '/welcome'
  end

  run! if app_file == $0
end
