require_relative '../lib/api.rb'

describe Api do

  subject(:api) { described_class.new }

  describe 'authentication_request' do
    it 'should not return nil' do
      expect(api.authentication_request).to be_truthy
    end
  end
  describe 'recipient_list' do
    it 'should return an array' do
      api.authentication_request
      expect(api.recipient_list).to eq([])
    end
  end
end
