# Earnshark SDK for Ruby
![sdk ruby](https://img.shields.io/badge/sdk-Ruby-ff69b4.svg)
[![Join the chat at https://gitter.im/99xt/earnshark-sdk-js](https://badges.gitter.im/99xt/earnshark-sdk-js.svg)](https://gitter.im/99xt/earnshark-sdk-js?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![serverless](http://public.serverless.com/badges/v3.svg)](http://www.serverless.com)
[![license](https://img.shields.io/npm/l/earnshark-sdk.svg)](https://www.npmjs.com/package/earnshark-sdk)

This is a Ruby SDK to call https://app.earnshark.com API endpoints. Contains methods to call the EarnShark API making the application integration fast.

## Functions Available 

* get_account_information - Retrieve information on a particular account/subscription
* get_license_information - Retrieve information on a particular license
* get_all_licenses_of_product - Retrieve all the license data for a particular product
* add_new_subscription - Add a new subscription to a product
* get_payment_url - Returns the payment portal URL for a subscription(linked to PayPal)
* get_account_payments - Returns all the payment transactions associated with the account
* renew_subscription - Renew/Update a Subscription

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'earnshark_sdk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install earnshark_sdk
    

## Usage

Initiliaze the Object,

The token key and the product ID are required (this can be taken from the EarnShark dashboard)
```ruby
key = ""
product_id = 9

```

```ruby
earnshark = EarnShark::API.new(product_id, key)
```

### Debug Mode 
If you need to see the responses without calling the live endpoints and send dummy responses
```ruby
earnshark.isTest(true)
```

### Add New Account
Creating new account, you need to pass the following data in the structure to the method
```ruby
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
```

```ruby
addNewRes = earnshark.add_new_subscription(body)
```

### Get account information
You will need to pass the account id for this,

```ruby
account_id = "123456"
accountInfo= earnshark.get_account_information(account_id)
```

### Renew a subscription with a new license
You will need to pass the current subscription id and the new license id to renew

```ruby
subscription_id = 84
new_license_id = 20

renew_subs= earnshark.renew_subscription( subscription_id, new_license_id )
```

### Get license information for a single license
Get the license information using the license id and the license token

```ruby
license_id = 17
license_token = ''

get_license= earnshark.get_license_information( license_id, license_token )
```

### Get all the licenses
Get all the licenses information
```ruby
all_licenses= earnshark.get_all_licenses_of_product()
```

### Get Transaction details for an account
Retrieve the processed/unprocessed transactions for an account
```ruby
account_transaction= earnshark.get_account_payments(account_id)
```

### Generate Payment URL to transfer to paymen gateway
Redirect URL is need to passed here as well
```ruby
redirect = 'http://app.earnshark.com';
payment_url= earnshark.get_payment_url(account_id, redirect)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at  https://github.com/99xt/earnshark-sdk-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

