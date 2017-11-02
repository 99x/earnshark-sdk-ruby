module EarnShark
  module Subscription
    # Adding new Subscription
    # Example response:
    #   { "status":"success", "message":"Subscription created without notifications and without invoice" }
    def new_subscription(body)
      post("#{base_url}product/#{@product_id}/addsubscriptionfromapi?key=#{@key}", body)
    end

    # Renew an Existing subscription
    # Example response:
    #   { "Date":"01/01/2016", "Cost":{ "value":"100", "currency":"USD" }, "Name":"5 Users Plan", "Product_ID":1, "Customer_ID":1, "Customer_Name":"Customer Name", "Account_ID":"123456", "Metadata":"{\"users\":\"10 users\"}", "Subscription_ID":1, "Tags":[ "10users" ], "License_ID":1, "Invalid":false, "Expired":false, "Billing_Cycle":{ "value":1, "type":"Monthly" }, "Description":"10 Users per month / 100", "Tenant_ID":"eu-west-1:00000000-0000-0000-0000-000000000000" }
    def renew_subscription(subscription_id, new_license_id)
      get("#{base_url}product/#@product_id/subscription/#{subscription_id}/apiRenewSubscriptionV2/#{new_license_id}?key=#@key")
    end

    # Get payment URL
    # Example response:
    # {"url":"http://app.earnshark.com.s3-website-eu-west-1.amazonaws.com/payments.html?transactionID=XXXXXXXXX"}
    def get_payment_url(account_id, redirect, new_license_id)
      body = { :redirect => redirect,
               :account_id => account_id,
               :product_id => @product_id,
               :key =>  @key,
               :new_license_id => new_license_id
             }
      post("#{base_url}/payments/getTransactionID", body)
    end

    def renewed_subscription_notifier(subscription_id, body)
      post("#{base_url}notification/#@product_id/subscription/#{subscription_id}?key=#@key", body)
    end
end
