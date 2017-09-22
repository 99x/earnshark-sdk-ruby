# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'earnshark_sdk/api/version'

Gem::Specification.new do |spec|
  spec.name          = "earnshark_sdk"
  spec.version       = EarnShark::Api::VERSION
  spec.authors       = ["Chamath Palihawadana", "Niveditha Karmegam"]
  spec.email         = ["chamathpali123@gmail.com", "kniveditha777@gmail.com"]

  spec.summary       = "This is a Ruby SDK to call https://app.earnshark.com API endpoints"
  spec.description   = "This is a Ruby SDK to call https://app.earnshark.com API endpoints. Contains methods to call the EarnShark API making the application integration fast"
  spec.homepage      = "https://github.com/99xt/earnshark-sdk-ruby"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
