require 'rest_client'

class Recipient

  attr_reader :name, :token, :url

  def initialize(token, name, url = 'https://coolpay.herokuapp.com/api/')
    @token = token
    @name = name
    @url = url
  end

  def create
    response = RestClient.post "#{url}recipients", values, headers
    p eval(response.body)
  end

  private
  def headers
    return {
      :content_type => "application/json",
      :authorization => "Bearer #{token}"
    }
  end

  def values
    return {
      "recipient": {
        "name": "#{name}"
      }
    }
  end
end
