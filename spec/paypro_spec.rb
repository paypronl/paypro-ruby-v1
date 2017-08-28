require 'spec_helper'

describe PayPro do
  it 'returns the correct version' do
    expect(PayPro::VERSION).to eql '0.0.1'
  end
end
