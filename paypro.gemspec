require File.expand_path('../lib/paypro/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'paypro'
  s.version = PayPro::VERSION
  s.license = 'MIT'
  s.homepage = 'https://github.com/paypronl/paypro-ruby-v1'
  s.author = 'PayPro'
  s.email = 'support@paypro.nl'
  s.summary = 'Ruby client for PayPro API v1'

  s.required_ruby_version = '>= 2.0.0'
  s.add_dependency 'faraday', '~> 0.13'

  s.add_development_dependency 'rspec', '~> 3.6'

  s.files = `git ls-files`.split("\n")
  s.test_files = Dir.glob('spec/**/*_spec.rb')

  s.require_path = 'lib'
end
