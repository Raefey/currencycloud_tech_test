require 'sinatra/base'
require_relative 'api.rb'
require_relative 'recipient.rb'
require_relative 'recipient_list.rb'
require_relative 'payment_list.rb'
require_relative 'payment.rb'

class Fakebook < Sinatra::Base

  enable :sessions

  get '/' do
    session[:api] = Api.new
    session[:token] = session[:api].authentication_request
    erb(:index)
  end

  get '/recipients' do
    session[:recipient_list] = RecipientList.new(session[:token])
    @recipients = session[:recipient_list].all
    erb(:recipients)
  end

  post '/new-recipient' do
    contact = Recipient.new(session[:token], params['new_recipient'])
    contact.create
    redirect('/recipients')
  end

  get '/new-payment' do
    erb(:new_payment)
  end

  post '/create-new-payment' do
    recipient_list = session[:recipient_list]
    user_id = recipient_list.search(params['name'])
    payment = Payment.new(session[:token], user_id, params['amount'], params['currency'])
    payment.create
    redirect('/payments')
  end

  get '/payments' do
    @payments = PaymentList.new(session[:token]).all
    erb(:payments)
  end

  run! if app_file == $0
end
