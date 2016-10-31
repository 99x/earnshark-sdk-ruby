module EarnShark
  module Request
    BASE_URL = 'https://app.earnshark.com/prod/product/'.freeze
    APP_DIR = 'http://earnsharkbeta.com.s3-website-eu-west-1.amazonaws.com/'.freeze
  end

=begin
  def post(url, body)
    HTTP.post(url, :json => body)
  end

  def get(url)
    HTTP.get(url).body
  end
=end

end
