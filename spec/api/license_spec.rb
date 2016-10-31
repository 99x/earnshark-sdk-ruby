require 'spec_helper'

describe EarnShark::License do
  before(:each) do
    @client = EarnShark::Api::Client.new('FAKE_ID','FAKE_KEY')
    @client.stub :get
  end

  describe '#get_license_information' do
    it 'calls #get with the correct url' do
      license_id = 42
      license_token = "L_TOKEN"
      @client.should_receive(:get).with("https://app.earnshark.com/prod/product/FAKE_ID/license/42/getlicensefromapi?key=L_TOKEN")
      @client.get_license_information(license_id, license_token)
    end
  end

  describe '#get_all_licenses' do
    it 'calls #get with the correct url' do
      @client.should_receive(:get).with("https://app.earnshark.com/prod/product/FAKE_ID/license/all?key=FAKE_KEY")
      @client.get_all_licenses
    end
  end

end
