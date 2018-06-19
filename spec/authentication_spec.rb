require_relative '../lib/authentication.rb'

describe Authentication do

  subject(:authentication) { described_class.new }

  describe 'response' do
    it 'should return something' do
      expect(authentication.response).to be_truthy
    end
  end
end
