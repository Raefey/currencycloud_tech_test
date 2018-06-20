require_relative '../lib/recipient.rb'
require_relative '../lib/api.rb'

describe Recipient do

  subject(:recipient) { described_class.new }

  describe 'creating recipient' do
    it 'should add a recipient to the exsisting list' do
      api = Api.new
      token = api.authentication_request
      recipient = Recipient.new(
        'raefe',
        token,
        'https://private-e7ba6d-coolpayapi.apiary-mock.com/api/'
      )
      expect(recipient.create).to be_an_instance_of(RestClient::Response)
    end
  end
end
