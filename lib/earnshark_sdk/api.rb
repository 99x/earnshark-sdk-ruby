# Base ruby requirements
require "http"

# Gem requirements
require "earnshark_sdk/api/account"
require "earnshark_sdk/api/license"
require "earnshark_sdk/api/request"
require "earnshark_sdk/api/subscription"
require "earnshark_sdk/api/version"

module EarnShark
  module Api
    class Client
      include Account
      include License
      include Request
      include Subscription

      #initialize the object with the earnshark product id and token provided
      def initialize(product_id,key)
        @product_id, @key = product_id , key
        @base_url = BASE_URL
        @app_dir = APP_DIR
      end

      def app_dir
        @app_dir
      end

      def base_url
        @base_url
      end

      def get_obj
        "product_id = #@product_id , token = #@key"
      end

      def post(url, body)
        HTTP.post(url, :json => body)
      end

      def get(url)
        HTTP.get(url).body
      end

    end
  end
end
