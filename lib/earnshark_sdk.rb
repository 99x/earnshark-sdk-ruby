require "earnshark_sdk/version"
require "http"

module EarnShark
  class API

    #initialize the object with the earnshark product id and token provided
  	def initialize(product_id,key)
  		@product_id, @key = product_id , key
  		@isTest = false
  		#URLS
  		@baseURL = 'https://app.earnshark.com/prod/product/';
		  @appDir = 'http://earnsharkbeta.com.s3-website-eu-west-1.amazonaws.com/';
  	end

  	def isTest(yes)
  		if(yes)
  			@isTest = true;
  		end
  	end

  	# Adding new Subscription 
  	def add_new_subscription(body)
  		# When test is true  
  		if(@isTest)
  			'{ "status":"success", "message":"Subscription created without notifications and without invoice" }'
  		else
        url = "#@baseURL#@product_id/addsubscriptionfromapi?key=#@key"
  	  	response =HTTP.post( url , :json => body)
        "#{response}"
  		end

  	end

  	# Get Account Information
  	def get_account_information(account_id)
  		# When test is true
  		if(@isTest)
  			'[ { "Date":"01/01/2016", "Cost":{ "value":"100", "currency":"USD" }, "Name":"5 Users Plan", "Product_ID":1, "Customer_ID":1, "Customer_Name":"Customer Name", "Account_ID":"123456", "Metadata":"{\"users\":\"10 users\"}", "Subscription_ID":1, "Tags":[ "10users" ], "License_ID":1, "Invalid":false, "Expired":false, "Billing_Cycle":{ "value":1, "type":"Monthly" }, "Description":"10 Users per month / 100", "Tenant_ID":"eu-west-1:00000000-0000-0000-0000-000000000000" } ]'
  		else
        url = "#@baseURL#@product_id/subscriptioninfo/#{account_id}?key=#@key"
        response = HTTP.get(url).body
        "#{response}"
  		end  		
  	end

  	# Get Information of a license created
  	def get_license_information(license_id, license_token)
  		# When test is true
  		if(@isTest)
  			'{ "Name":"License Name", "Cost":{ "value":"100", "currency":"USD" }, "Tags":[ "10 User Package" ], "License_ID":1, "Product_ID":1, "Description":"10 Users per month / 100", "Billing_Cycle":{ "value":1, "type":"Monthly" }, "Metadata":"{\"users\":\"10\"}" }'
  		else
  			url = "#@baseURL#@product_id/license/#{license_id}/getlicensefromapi?key=#{license_token}"
        response = HTTP.get(url).body
        "#{response}"
  		end  		
  	end

  	# Renew an Existing subscription
  	def renew_subscription(subscription_id, new_license_id)
  		# When test is true
  		if(@isTest)
  			'{ "Date":"01/01/2016", "Cost":{ "value":"100", "currency":"USD" }, "Name":"5 Users Plan", "Product_ID":1, "Customer_ID":1, "Customer_Name":"Customer Name", "Account_ID":"123456", "Metadata":"{\"users\":\"10 users\"}", "Subscription_ID":1, "Tags":[ "10users" ], "License_ID":1, "Invalid":false, "Expired":false, "Billing_Cycle":{ "value":1, "type":"Monthly" }, "Description":"10 Users per month / 100", "Tenant_ID":"eu-west-1:00000000-0000-0000-0000-000000000000" }'
  		else
        url = "#@baseURL#@product_id/subscription/#{subscription_id}/apiRenewSubscription/#{new_license_id}?key=#@key"
        response = HTTP.get(url).body
        "#{response}"
  		end  		
  	end


  	# Get all the Licenses of the current product
  	def get_all_licenses_of_product()
  		# When test is true
  		if(@isTest)
  			'[{"Name":"License Name","Cost":{"value":"10","currency":"USD"},"Tags":["free","test","trial"],"License_ID":1,"Product_ID":1,"Description":"Test","Billing_Cycle":{"value":1,"type":"Monthly"},"Metadata":"{}"}]'
  		else
        url = "#@baseURL#@product_id/license/all?key=#@key"
        response = HTTP.get(url).body
        "#{response}"
  		end  		
  	end

  	# Get the payment transactions for an account
  	def get_account_payments(account_id)
  		# When test is true
  		if(@isTest)
  			'[ { "Amount":"100", "Created_At":"1474872974062", "Currency":"USD", "Product_ID":1, "PayPal_Transaction":"PAY-11111111111", "Updated_At":"1474872974062", "Account_ID":"local", "PayPal_Payer_ID":"111111", "Subscription_ID":1, "Payment_Processed":true, "Payout_ID":"12345", "Payment_Sent":true, "PayPal_Payment_ID":"PAY-11111111111" } ]'
  		else
  		  url = "#@baseURL#@product_id/account/#{account_id}/transactions?key=#@key"
        response = HTTP.get(url).body
        "#{response}"
  		end  		
  	end

  	# Get payment URL
  	def get_payment_url(account_id, redirect)
  		"#@appDir"+"payment.html?redirect=#{redirect}&productID=#@product_id&accountID=#{account_id}&key=#@key"
   	end

  	def get_obj
  		"product_id = #@product_id , token = #@key , isTest = #@isTest"
  	end

  end
end
