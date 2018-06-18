require 'envyable'
Envyable.load('config/env.yml')

class Coolpay


  def self.get_data(url = 'https://coolpay.herokuapp.com/api/login', http_class = Net::HTTP)
    uri = URI.parse(url)
    response = http_class.get_response(uri)
    JSON.parse(response.body)
  end

  private
  def values
    username = ENV["API_USERNAME"]
    api_key = ENV["API_KEY"]
    hash = {"username": username, "apikey", api_key}
    return "#{hash}"
  end

  def headers
    {:content_type => 'application/json'}
  end

end
