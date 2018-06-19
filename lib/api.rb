require 'envyable'
require 'rest_client'
Envyable.load('config/env.yml')

class Api

  attr_reader :token

  def initialize
    @token = token
  end

  def authentication_request
    response = RestClient.post 'https://coolpay.herokuapp.com/api/login', values, login_headers
    @token = eval(response.body)[:token]
  end

  def recipient_list
    response = RestClient.get 'https://coolpay.herokuapp.com/api/recipients', authorized_headers
    p eval(response.body)[:recipients]
  end

  private
  def values
    username = ENV["API_USERNAME"]
    api_key = ENV["API_KEY"]
    {"username": username, "apikey": api_key}
  end

  def login_headers
    return {:content_type => 'application/json'}
  end

  def authorized_headers
    return {
      :content_type => "application/json",
      :authorization => "Bearer #{token}"
    }
  end
end
