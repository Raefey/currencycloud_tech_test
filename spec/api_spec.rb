require_relative '../lib/api.rb'

describe Api do

  subject(:api) { described_class.new }

  describe 'authentication_request' do
    it 'should not return nil' do
      expect(api.authentication_request).to be_truthy
    end
  end
end
