require 'rest_client'
require_relative 'recipient_list.rb'

class PaymentList

  attr_reader :token, :url, :recipient_list

  def initialize(token, url = 'https://coolpay.herokuapp.com/api/', recipient_list = RecipientList)
    @url = url
    @token = token
    @recipient_list = recipient_list
  end

  def all
    response = RestClient.get "#{url}payments", headers
    p eval(response.body)[:payments]
  end

  def name_field_creator(array)
    array.each {|payment|  payment.merge!("name": id_converter(payment[:id]))}
  end

  private
  def headers
    return {
      :content_type => "application/json",
      :authorization => "Bearer #{token}"
    }
  end

  def id_converter(user_id)
    recipient_list.new(token).search_by_id(user_id)
  end
end
