module EarnShark
  module Subscription
    # Adding new Subscription
    # Example response:
    #   { "status":"success", "message":"Subscription created without notifications and without invoice" }
    def new_subscription(body)
      post("#{base_url}#{@product_id}/addsubscriptionfromapi?key=#{@key}", body)
    end

    # Renew an Existing subscription
    # Example response:
    #   { "Date":"01/01/2016", "Cost":{ "value":"100", "currency":"USD" }, "Name":"5 Users Plan", "Product_ID":1, "Customer_ID":1, "Customer_Name":"Customer Name", "Account_ID":"123456", "Metadata":"{\"users\":\"10 users\"}", "Subscription_ID":1, "Tags":[ "10users" ], "License_ID":1, "Invalid":false, "Expired":false, "Billing_Cycle":{ "value":1, "type":"Monthly" }, "Description":"10 Users per month / 100", "Tenant_ID":"eu-west-1:00000000-0000-0000-0000-000000000000" }
    def renew_subscription(subscription_id, new_license_id)
      get("#{base_url}#@product_id/subscription/#{subscription_id}/apiRenewSubscription/#{new_license_id}?key=#@key")
    end

    # Get payment URL
    def get_payment_url(account_id, redirect)
      puts "YESSSSSSSSSSSSS!"
      "#{app_dir}"+"payment.html?redirect=#{redirect}&productID=#@product_id&accountID=#{account_id}&key=#@key"
    end

  end
end
