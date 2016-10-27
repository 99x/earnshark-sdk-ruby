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

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at  https://github.com/99xt/earnshark-sdk-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

