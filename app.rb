require 'sinatra/base'

class Coolpay < Sinatra::Base
  get "/" do
    "Hello world"
  end

  run! if app_file == $0
end
