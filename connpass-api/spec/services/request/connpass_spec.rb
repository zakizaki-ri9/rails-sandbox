# typed: false
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Request::Connpass do
  let(:request_connpass) { build(:request_connpass) }
  let(:request_connpass_count_over) { build(:request_connpass_count_over) }

  it 'Valid if count is within 1-100' do
    expect(request_connpass.valid?).to eq true
  end

  it 'Invalid if count exceeds 100' do
    expect(request_connpass_count_over.valid?).to eq false
  end
end
