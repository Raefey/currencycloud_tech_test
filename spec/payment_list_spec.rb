require_relative '../lib/payment_list.rb'

describe PaymentList do

  subject(:payment_list){ described_class.new(@token, "https://private-e7ba6d-coolpayapi.apiary-mock.com/api/") }

  before(:each) do
    api = Api.new
    @token = api.authentication_request
  end

  describe '.all' do
    it 'should return an array of payments' do
      expect(payment_list.all).kind_of?(Array)
    end
  end

  describe '.name_field_creator' do
    it 'should add a new key/value pair to a has inside an array' do
      allow(payment_list).to receive(:id_converter).and_return('raefe')
      expect(payment_list.name_field_creator([{:age => 21}])).to eq([{:age => 21, :name =>'raefe'}])
    end
  end

end
