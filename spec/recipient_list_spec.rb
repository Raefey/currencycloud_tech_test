require_relative '../lib/recipient_list.rb'

describe RecipientList do

  subject(:recipient_list){ described_class.new }

  before(:each) do
    api = Api.new
    @token = api.authentication_request
  end

  describe '.list' do
    it 'should return an array' do
      recipient_list = RecipientList.new(@token, "https://private-e7ba6d-coolpayapi.apiary-mock.com/api/")
      expect(recipient_list.all).kind_of?(Array)
    end
  end
end
