require 'sinatra/base'
require_relative 'api.rb'
require_relative 'recipient.rb'

class Fakebook < Sinatra::Base

  get '/' do
    api = Api.new
    @token = api.authentication_request
    @recipients = api.recipient_list
    erb(:index)
  end

  post '/new-recipient' do
    contact = Recipient.new(params['new_recipient'], @token)
    redirect('/')
  end

  run! if app_file == $0
end
