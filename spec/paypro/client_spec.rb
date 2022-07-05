# frozen_string_literal: true

require 'spec_helper'

describe PayPro::Client do
  let(:api_key) { 'a16e84b3ef5a80ef9af289d37788e87e' }
  let(:client) { described_class.new(api_key) }

  describe '#initialize' do
    let(:client) { described_class.new(api_key) }

    it 'sets params to an empty hash' do
      expect(client.params).to eql({})
    end
  end

  describe '#body' do
    let(:command) { 'create_payment' }

    subject { client.body }

    before { client.command = command }

    it { is_expected.to include(apikey: api_key) }
    it { is_expected.to include(command: command) }

    context 'when params is empty' do
      it { is_expected.to include(params: '{}') }
    end

    context 'when params is not empty' do
      before { client.params = { amount: 500 } }
      it { is_expected.to include(params: '{"amount":500}') }
    end
  end

  describe '#execute' do
    let(:client) { described_class.new(api_key, conn) }
    let(:conn) do
      Faraday.new do |builder|
        builder.adapter :test, stubs
      end
    end

    subject { client.execute }

    context 'when connection fails' do
      let(:conn) { double }

      before { allow(conn).to receive(:post).and_raise(Faraday::ClientError, 'Message') }

      it 'raises a PayPro::Connection error' do
        expect { subject }.to raise_error(PayPro::ConnectionError, kind_of(String))
      end
    end

    context 'when body is invalid json' do
      let(:stubs) do
        Faraday::Adapter::Test::Stubs.new do |stub|
          stub.post('/') { |_| [200, {}, 'invalid json }'] }
        end
      end

      it 'raises a PayPro::InvalidResponse error' do
        expect { subject }.to raise_error(
          PayPro::InvalidResponseError,
          'The API request returned an error or is invalid: invalid json }'
        )
      end
    end

    context 'when api returns an error' do
      let(:stubs) do
        Faraday::Adapter::Test::Stubs.new do |stub|
          stub.post('/') { |_| [200, {}, 'Invalid amount'] }
        end
      end

      it 'raises a PayPro::InvalidResponse error' do
        expect { subject }.to raise_error(
          PayPro::InvalidResponseError,
          'The API request returned an error or is invalid: Invalid amount'
        )
      end
    end

    context 'when api call is valid' do
      let(:stubs) do
        Faraday::Adapter::Test::Stubs.new do |stub|
          stub.post('/') do |_|
            [
              200,
              {},
              '{"payment_url":"https://paypro.nl/betalen/payment_hash","payment_hash":"payment_hash"}'
            ]
          end
        end
      end

      before { client.params = { amount: 500 } }

      it 'returns a hash with the response' do
        expect(subject).to include(
          'payment_url' => 'https://paypro.nl/betalen/payment_hash',
          'payment_hash' => 'payment_hash'
        )
      end

      it 'clears the old params' do
        expect { subject }.to change { client.params }.from(amount: 500).to({})
      end
    end
  end
end
