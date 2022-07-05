require 'openssl'
require 'json'

require 'faraday'

require 'paypro/client'
require 'paypro/errors'
require 'paypro/version'

module PayPro
  CA_BUNDLE_FILE = File.dirname(__FILE__) + '/data/ca-bundle.crt'
  API_URL = 'https://www.paypro.nl/post_api'.freeze
  API_VERSION = 'v1'.freeze
end
