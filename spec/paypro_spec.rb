require 'spec_helper'

describe PayPro do
  it 'returns the correct api url' do
    expect(described_class::API_URL).to eql 'https://paypro.nl/post_api'
  end

  it 'returns the correct path for ca-bundle.crt' do
    expect(File).to exist(described_class::CA_BUNDLE_FILE)
  end
end
