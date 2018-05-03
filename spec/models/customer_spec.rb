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


  context 'Methods' do
    describe '#favorite_merchant' do
      it 'should return the customers favorite merchant' do
        customer = create(:customer)
        merchant_1, merchant_2 = create_list(:merchant, 2)
        create_list(:invoice, 3, customer: customer, merchant: merchant_1)
        create_list(:invoice, 2, customer: customer, merchant: merchant_2)

        Invoice.all.each do |invoice|
          create(:transaction, invoice: invoice)
        end

        expect(customer.favorite_merchant).to eq(merchant_1)
      end
    end
  end
end
