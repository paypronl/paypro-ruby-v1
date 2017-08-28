require 'logger'
require 'openssl'
require 'json'

require 'faraday'

require 'paypro/version'
require 'paypro/client'

module PayPro
  CA_BUNDLE_FILE = File.dirname(__FILE__) + '/data/ca-bundle.crt'
  API_URL = 'https://www.paypro.nl/post_api'.freeze
end
