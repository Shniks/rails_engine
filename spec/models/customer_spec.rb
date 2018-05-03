require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end


  describe 'Relationships' do
    it { is_expected.to have_many(:invoices) }
    it { is_expected.to have_many(:transactions).through(:invoices) }
  end
end
