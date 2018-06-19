require 'envyable'
require 'rest_client'
Envyable.load('config/env.yml')

class Api

  def authentication_request(url = 'https://coolpay.herokuapp.com/api/login')
    response = RestClient.post url, values, headers
    p response.body
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
