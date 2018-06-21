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

  def search(name)
    response = RestClient.get "#{url}recipients?name=#{name}", headers
    p eval(response.body)[:recipients][0][:id]
  end

  def search_by_id(user_id)
    user = all.select { |recipient| recipient[:id] == user_id }
    user[0][:name]
  end

  private
  def headers
    return {
      :content_type => "application/json",
      :authorization => "Bearer #{token}"
    }
  end
end
