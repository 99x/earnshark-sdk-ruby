module EarnShark
  module Account
    # Get Account Information
    # Example response:
    #   [ { "Date":"01/01/2016", "Cost":{ "value":"100", "currency":"USD" }, "Name":"5 Users Plan", "Product_ID":1, "Customer_ID":1, "Customer_Name":"Customer Name", "Account_ID":"123456", "Metadata":"{\"users\":\"10 users\"}", "Subscription_ID":1, "Tags":[ "10users" ], "License_ID":1, "Invalid":false, "Expired":false, "Billing_Cycle":{ "value":1, "type":"Monthly" }, "Description":"10 Users per month / 100", "Tenant_ID":"eu-west-1:00000000-0000-0000-0000-000000000000" } ]
    def get_account_information(account_id)
      get("#{base_url}product/#{@product_id}/subscriptioninfo/#{account_id}?key=#{@key}")
    end

    # Get the payment transactions for an account
    # Example response:
    #   [ { "Amount":"100", "Created_At":"1474872974062", "Currency":"USD", "Product_ID":1, "PayPal_Transaction":"PAY-11111111111", "Updated_At":"1474872974062", "Account_ID":"local", "PayPal_Payer_ID":"111111", "Subscription_ID":1, "Payment_Processed":true, "Payout_ID":"12345", "Payment_Sent":true, "PayPal_Payment_ID":"PAY-11111111111" } ]'
    def get_account_payments(account_id)
      get("#{base_url}product/#{@product_id}/account/#{account_id}/transactions?key=#{@key}")
    end

  end
end
