# frozen_string_literal: true

require File.expand_path('lib/paypro/version', __dir__)

Gem::Specification.new do |s|
  s.name = 'paypro'
  s.version = PayPro::VERSION
  s.license = 'MIT'
  s.homepage = 'https://github.com/paypronl/paypro-ruby-v1'
  s.author = 'PayPro'
  s.email = 'support@paypro.nl'
  s.summary = 'Ruby client for PayPro API v1'

  s.required_ruby_version = '>= 2.4.0'
  s.add_dependency 'faraday', '>= 0.13', '< 2'

  s.add_development_dependency 'rspec', '~> 3.6'

  s.files = `git ls-files`.split("\n")
  s.test_files = Dir.glob('spec/**/*_spec.rb')

  s.require_path = 'lib'
end
