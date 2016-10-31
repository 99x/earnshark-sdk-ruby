module EarnShark
  module License
    # Get Information of a license created
    # Example response:
    #   { "Name":"License Name", "Cost":{ "value":"100", "currency":"USD" }, "Tags":[ "10 User Package" ], "License_ID":1, "Product_ID":1, "Description":"10 Users per month / 100", "Billing_Cycle":{ "value":1, "type":"Monthly" }, "Metadata":"{\"users\":\"10\"}" }
    def get_license_information(license_id, license_token)
      get("#{base_url}#{@product_id}/license/#{license_id}/getlicensefromapi?key=#{license_token}")
    end

    # Get all the Licenses of the current product
    # Example response:
    #   [{"Name":"License Name","Cost":{"value":"10","currency":"USD"},"Tags":["free","test","trial"],"License_ID":1,"Product_ID":1,"Description":"Test","Billing_Cycle":{"value":1,"type":"Monthly"},"Metadata":"{}"}]
    def get_all_licenses
      get("#{base_url}#{@product_id}/license/all?key=#{@key}")
    end
    
  end
end
