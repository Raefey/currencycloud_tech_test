require_relative '../lib/payment_list.rb'

describe PaymentList do

  subject(:payment_list){ described_class.new }

  before(:each) do
    api = Api.new
    @token = api.authentication_request
  end

  describe '.all' do
    it 'should return an array of payments' do
      payment_list = PaymentList.new(@token, "https://private-e7ba6d-coolpayapi.apiary-mock.com/api/")
      expect(payment_list.all).kind_of?(Array)
    end
  end
end
