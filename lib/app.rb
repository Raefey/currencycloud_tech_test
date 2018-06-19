require 'sinatra/base'
require_relative 'authentication.rb'

class Fakebook < Sinatra::Base

  get '/' do
    erb(:index)
  end

  run! if app_file == $0
end
