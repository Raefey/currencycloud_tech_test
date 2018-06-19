require 'envyable'
require 'rest_client'
Envyable.load('config/env.yml')

class Coolpay

  def response(url = 'https://coolpay.herokuapp.com/api/login')
    p 'rafe'
  end

  private
  def values
    username = ENV["API_USERNAME"]
    api_key = ENV["API_KEY"]
    account_hash = {"username": username, "apikey": api_key}
    return "#{account_hash}"
  end

  def headers
    return {:content_type => 'application/json'}
  end

end
