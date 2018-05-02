require 'rails_helper'

describe InvoiceItems, type: :model do
  it { is_expected.to validate_presence_of(:unit_price) }
  it { is_expected.to validate_presence_of(:quantity) }

  it { is_expected.to have_many(:invoices) }
  it { is_expected.to have_many(:items) }
end