require_relative '../lib/api.rb'

describe Api do

  subject(:api) { described_class.new }

  describe 'response' do
    it 'should return something' do
      expect(api.authentication_request).to be_truthy
    end
  end
end
