require_relative '../lib/recipient.rb'
require_relative '../lib/api.rb'

describe Recipient do

  subject(:recipient) { described_class.new }

  before(:each) do
    api = Api.new
    @token = api.authentication_request
  end

  describe '.create' do
    it 'should add a recipient to the exsisting list' do
      recipient = Recipient.new('Jake McFriend', @token, 'https://private-e7ba6d-coolpayapi.apiary-mock.com/api/')
      expect(recipient.create[:recipient][:name]).to eq('Jake McFriend')
    end
  end
end
