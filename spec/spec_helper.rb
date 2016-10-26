$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "earnshark_sdk"

product_id = 9

key = ""

body = {
            :account => {
                    :name =>"Account Name",
                    :email => "Account@example.com",
                    :accountID => "12345678",
                    :start_date =>  "01/01/2016"
                },
                :license_id => 17,
                :enableNotifications => false,
                :sendInvoiceNow => true
         }

account_id = "123456"


earnshark = EarnShark::API.new(product_id, key)

#earnshark.isTest(true)

addNewRes= earnshark.add_new_subscription(body)

puts "\n"
puts "Add new account Response:\n #{addNewRes}"


accountInfo= earnshark.get_account_information(account_id)
puts "\n\n"
puts "Get account information:\n #{accountInfo}"


subscription_id = 84
new_license_id = 20

renew_subs= earnshark.renew_subscription( subscription_id, new_license_id )
puts "\n\n"
puts "Renew Subscripiton with a new license:\n #{renew_subs}"

license_id = 17
license_token = ''

get_license= earnshark.get_license_information( license_id, license_token )
puts "\n\n"
puts "Get License Information:\n #{get_license}"

all_licenses= earnshark.get_all_licenses_of_product()
puts "\n\n"
puts "All Licenses information:\n #{all_licenses}"


account_transaction= earnshark.get_account_payments(account_id)
puts "\n\n"
puts "Payment Transactions of account:\n #{account_transaction}"


redirect = 'http://app.earnshark.com';
payment_url= earnshark.get_payment_url(account_id, redirect)
puts "\n\n"
puts "Payment URL for an account:\n #{payment_url}"



