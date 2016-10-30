require 'spec_helper'

describe EarnShark::Subscription do
  before(:each) do
    @client = EarnShark::Api::Client.new('FAKE_ID','FAKE_KEY')
    @client.stub :get
    @client.stub :post
  end

  describe '#new_subscription' do
    it 'calls #post with the correct url and data' do
      body = "blahblahblah"
      @client.should_receive(:post).with("https://app.earnshark.com/prod/product/FAKE_ID/addsubscriptionfromapi?key=FAKE_KEY",body)
      @client.new_subscription(body)
    end
  end

  describe '#renew_subscription' do
    it 'calls #get with the correct url' do
      subscription_id = 42
      new_license_id = 74
      @client.should_receive(:get).with("https://app.earnshark.com/prod/product/FAKE_ID/subscription/42/apiRenewSubscription/74?key=FAKE_KEY")
      @client.renew_subscription(subscription_id, new_license_id)
    end
  end

  describe '#get_payment_url' do
    it 'returns the correct url' do
      account_id = 42
      redirect = "blahblah"
      url = @client.get_payment_url(account_id, redirect)
      url.should eq("http://earnsharkbeta.com.s3-website-eu-west-1.amazonaws.com/payment.html?redirect=blahblah&productID=FAKE_ID&accountID=42&key=FAKE_KEY")
    end
  end

end
