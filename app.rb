require 'sinatra/base'
require 'sinatra/flash'

class AirCouch < Sinatra::Base
  get '/' do
    "Welcome to AirCouch"
  end

  run! if app_file == $0
end