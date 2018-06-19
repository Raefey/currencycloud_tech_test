require 'sinatra/base'
require_relative 'api.rb'

class Fakebook < Sinatra::Base

  get '/' do
    api = Api.new
    api.authentication_request
    @recipients = api.recipient_list
    erb(:index)
  end

  run! if app_file == $0
end
