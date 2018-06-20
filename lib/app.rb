require 'sinatra/base'
require_relative 'api.rb'
require_relative 'recipient.rb'

class Fakebook < Sinatra::Base

  enable :sessions

  get '/' do
    session[:api] = Api.new
    session[:token] = session[:api].authentication_request
    erb(:index)
  end

  get '/recipients' do
    @api = session[:api]
    @recipients = RecipientList.new(session[:token]).all
    erb(:recipients)
  end

  post '/new-recipient' do
    contact = Recipient.new(params['new_recipient'], @token)
    contact.create
    redirect('/')
  end

  run! if app_file == $0
end
