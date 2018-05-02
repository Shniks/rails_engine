require 'rails_helper'

describe InvoiceItem, type: :model do
  it { is_expected.to validate_presence_of(:unit_price) }
  it { is_expected.to validate_presence_of(:quantity) }

  it { is_expected.to belong_to(:invoice) }
  it { is_expected.to belong_to(:item) }
end