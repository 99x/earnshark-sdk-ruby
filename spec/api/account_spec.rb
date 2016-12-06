require 'spec_helper'

describe EarnShark::Account do
  before(:each) do
    @client = EarnShark::Api::Client.new('FAKE_ID','FAKE_KEY')
    @client.stub :get
  end

  describe '#get_account_information' do
    it 'calls #get with the correct url' do
      account_id = 42
      @client.should_receive(:get).with("https://app.earnshark.com/prod/product/FAKE_ID/subscriptioninfo/42?key=FAKE_KEY")
      @client.get_account_information(account_id)
    end
  end

  describe '#get_account_payments' do
    it 'calls #get with the correct url' do
      account_id = 42
      @client.should_receive(:get).with("https://app.earnshark.com/prod/product/FAKE_ID/account/42/transactions?key=FAKE_KEY")
      @client.get_account_payments(account_id)
    end
  end

end
