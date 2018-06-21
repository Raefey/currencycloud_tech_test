require_relative '../lib/recipient_list.rb'

describe RecipientList do

  subject(:recipient_list){ described_class.new(@token, "https://private-e7ba6d-coolpayapi.apiary-mock.com/api/") }

  before(:each) do
    api = Api.new
    @token = api.authentication_request
  end

  describe '.all' do
    it 'should return an array of recipients' do
      expect(recipient_list.all).kind_of?(Array)
    end
  end

  describe '.search' do
    it 'should return a user_id' do
      expect(recipient_list.search("Jake McFriend")).to eq("6e7b4cea-5957-11e6-8b77-86f30ca893d3")
    end
  end

  describe '.search_by_id' do
    it 'should return a name relating to the user ID' do
      expect(recipient_list.search_by_id("6e7b4cea-5957-11e6-8b77-86f30ca893d3")).to eq("Jake McFriend")
    end
  end
end
