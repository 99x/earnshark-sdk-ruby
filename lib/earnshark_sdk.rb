require "earnshark_sdk/version"

module EarnShark
  class API

    #initialize the object with the earnshark product id and token provided
  	def initialize(product_id,key)
  		@product_id, @key = product_id , key
  	end

  	def get_obj
  		"product_id = #@product_id , token = #@key"
  	end
  end
end
