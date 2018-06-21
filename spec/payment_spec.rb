require_relative '../lib/api.rb'
require_relative '../lib/recipient.rb'
require_relative '../lib/payment.rb'

describe Payment do

  subject(:payment) { described_class.new(@token, @unique_id, 10.50, "GBP", "https://private-e7ba6d-coolpayapi.apiary-mock.com/api/") }

  before(:each) do
    api = Api.new
    @token = api.authentication_request
    recipient = Recipient.new(@token, 'raefe', 'https://private-e7ba6d-coolpayapi.apiary-mock.com/api/')
    @unique_id = recipient.create[:recipient][:id]
  end

  describe '.create' do
    it 'should add a payment to the list of existing payments' do
      expect(payment.create[:payment][:amount]).to eq("10.5")
    end
  end
end
