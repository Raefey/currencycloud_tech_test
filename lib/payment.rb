require 'rest_client'

class Payment

  attr_reader :token, :recipient_id, :amount, :currency, :url

  def initialize(token, recipient_id, amount, currency, url = 'https://coolpay.herokuapp.com/api/')
    @token = token
    @recipient_id = recipient_id
    @amount = amount
    @currency = currency
    @url = url
  end

  def create
    response = RestClient.post "#{url}payments", values, headers
    p eval(response.body)
  end

  private
  def headers
    return {
      :content_type => 'application/json',
      :authorization => "Bearer #{token}"
    }
  end

  def values
    return {
      "payment": {
        "amount": amount,
        "currency": "#{currency}",
        "recipient_id": "#{recipient_id}"
      }
    }
  end
end
