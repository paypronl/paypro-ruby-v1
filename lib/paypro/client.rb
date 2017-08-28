module PayPro
  # Client class
  class Client
    attr_accessor :command, :params

    def initialize(api_key)
      @api_key = api_key
      @params = {}
      @conn = Faraday.new(
        PayPro::API_URL,
        ssl: {
          cert_store: cert_store
        }
      )
    end

    def execute
      conn.post do |req|
        req.body = body
      end
    end

    private

    def body
      JSON.generate(
        api_key: @api_key,
        command: @command,
        params: @params
      )
    end

    def ca_bundle_file
      PayPro::CA_BUNDLE_FILE
    end

    def cert_store
      cert_store = OpenSSL::X509::Store.new
      cert_store.add_file ca_bundle_file
      cert_store
    end
  end
end
