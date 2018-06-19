require_relative '../lib/coolpay.rb'

describe Coolpay do

  subject(:coolpay) { described_class.new }

  describe 'response' do
    it 'should return something' do
      expect(coolpay.response).to be_truthy
    end
  end
end
