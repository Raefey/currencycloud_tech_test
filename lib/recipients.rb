require 'rest_client'

class Recipient

  attr_reader :name

  def initialize(name, token)
    @name = name
  end

  def create
    RestClient.post 'https://coolpay.herokuapp.com/api/recipients', values, headers
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
