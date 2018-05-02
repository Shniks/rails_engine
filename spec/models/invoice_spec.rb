require 'rails_helper'

describe Invoice, type: :model do
  it { is_expected.to validate_presence_of(:status) }

  it { is_expected.to belong_to(:customer) }
  it { is_expected.to belong_to(:merchant) }
end