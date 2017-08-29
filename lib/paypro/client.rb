module PayPro
  # Client class to connect to the PayPro V1 API.
  # Requires an API key to authenticate API calls, you
  # can also supply your own Faraday connection instead of the default one.
  # This can be useful if you want to add more middleware or want finer
  # control of the connection being used.
  class Client
    attr_accessor :command, :params

    def initialize(api_key, conn = default_conn)
      @api_key = api_key
      @params = {}
      @conn = conn
    end

    # Executes the API call and handles the response. Will raise errors if
    # there were problems while connecting or handeling the response.
    def execute
      response = @conn.post do |req|
        req.body = body
      end
      handle_response(response)
    rescue Faraday::ClientError => e
      raise ConnectionError, "Could not connect to the PayPro API: #{e.inspect}"
    end

    # Returns the body that is used in the POST request.
    def body
      {
        apikey: @api_key,
        command: @command,
        params: JSON.generate(@params)
      }
    end

    private

    def ca_bundle_file
      PayPro::CA_BUNDLE_FILE
    end

    def cert_store
      cert_store = OpenSSL::X509::Store.new
      cert_store.add_file ca_bundle_file
      cert_store
    end

    def default_conn
      Faraday.new(
        PayPro::API_URL,
        ssl: {
          cert_store: cert_store,
          verify: true
        }
      )
    end

    def handle_response(response)
      parsed_response = JSON.parse(response.body)
      @params = {}
      parsed_response
    rescue JSON::ParserError
      raise InvalidResponseError, "The API request returned an error or is invalid: #{response.body}"
    end
  end
end
