require 'envyable'
require 'rest_client'
Envyable.load('config/env.yml')

class Authentication

  def response(url = 'https://coolpay.herokuapp.com/api/login')
    RestClient.post url, values, headers
  end

  def recipients
    headers = {
      :content_type => 'application/json',
      :authorization => 'Bearer 12345.yourtoken.67890'
    }

    response = RestClient.get 'https://coolpay.herokuapp.com/api/recipients', headers
    puts response
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
