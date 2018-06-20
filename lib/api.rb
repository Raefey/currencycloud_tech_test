require 'envyable'
require 'rest_client'
Envyable.load('config/env.yml')

class Api

  attr_reader :token, :url

  def initialize(url = 'https://coolpay.herokuapp.com/api/')
    @token = token
    @url = url
  end

  def authentication_request
    response = RestClient.post "#{url}login", values, headers
    @token = eval(response.body)[:token]
  end

  private
  def values
    username = ENV["API_USERNAME"]
    api_key = ENV["API_KEY"]
    {"username": username, "apikey": api_key}
  end

  def headers
    return {:content_type => 'application/json'}
  end
end
