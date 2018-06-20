require 'rest_client'

class PaymentList

  attr_reader :token, :url

  def initialize(token, url = 'https://coolpay.herokuapp.com/api/')
    @url = url
    @token = token
  end

  def all
    response = RestClient.get "#{url}payments", headers
    p eval(response.body)
  end

  private
  def headers
    return {
      :content_type => "application/json",
      :authorization => "Bearer #{token}"
    }
  end
end
