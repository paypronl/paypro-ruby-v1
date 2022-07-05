# frozen_string_literal: true

require 'paypro'

client = PayPro::Client.new('b507a4d8ea7911f0d955383852990df3')
client.command = 'get_all_pay_methods'
client.execute
