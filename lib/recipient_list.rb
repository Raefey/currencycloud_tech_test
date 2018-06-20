require 'rest_client'

class RecipientList

  attr_reader :token, :url

  def initialize(token, url = 'https://coolpay.herokuapp.com/api/')
    @url = url
    @token = token
  end

  def all
    response = RestClient.get "#{url}recipients", headers
    p eval(response.body)[:recipients]
  end

  private
  def headers
    return {
      :content_type => "application/json",
      :authorization => "Bearer #{token}"
    }
  end
end
