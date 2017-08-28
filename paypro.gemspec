require File.expand_path('../lib/paypro/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'paypro'
  s.version = PayPro::VERSION
  s.license = 'MIT'
  s.homepage = 'https://github.com/paypronl/paypro-ruby-v1'
  s.author = 'PayPro'
  s.email = 'support@paypro.nl'
  s.summary = 'Ruby client for PayPro API v1'
  s.description = s.summary

  s.required_ruby_version = '>= 1.9.3'
  s.add_dependency 'faraday', '~> 0.13'

  s.files = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
