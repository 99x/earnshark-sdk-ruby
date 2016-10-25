$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "earnshark_sdk"

product_id = 0
key = "test"

earnshark = EarnShark::API.new(product_id, key)

res= earnshark.get_obj

puts res