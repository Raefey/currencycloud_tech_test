require_relative '../lib/coolpay.rb'

describe Coolpay do

  subject(:coolpay) { described_class.new }

  describe 'response' do
    it 'should return something' do
      expect(coolpay.response).not_to be_nil
    end
  end
end
