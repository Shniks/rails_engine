require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Relationships' do
    it { is_expected.to have_many(:items) }
    it { is_expected.to have_many(:invoices) }
  end

  describe 'Instance Methods' do
    describe '#total_revenue' do
      it 'returns the total revenue for a merchant' do
        merchant = create(:merchant)
        date = Date.new(1969, 7, 20)
        invoice_1, invoice_2 = create_list(:invoice, 2, merchant: merchant)
        invoice_3 = create(:invoice, created_at: date, merchant: merchant)
        create(:transaction, invoice_id: invoice_1.id, result: "success")
        create(:transaction, invoice_id: invoice_3.id, result: "success")
        create(:transaction, invoice_id: invoice_2.id, result: "failed")
        create(:invoice_item, unit_price: 11000, quantity: 4, invoice: invoice_1)
        create(:invoice_item, unit_price: 3000, quantity: 2, invoice: invoice_2)
        create(:invoice_item, unit_price: 6000, quantity: 3, invoice: invoice_3)

        expect(merchant.total_revenue).to eq(62000)
      end
    end

    describe '#total_revenue_by_date' do
      it 'returns the total revenue for a merchant for a date' do
        merchant = create(:merchant)
        date = Date.new(1969, 7, 20)
        invoice_1, invoice_2 = create_list(:invoice, 2, merchant: merchant)
        invoice_3 = create(:invoice, created_at: date, merchant: merchant)
        create(:transaction, invoice_id: invoice_1.id, result: "success")
        create(:transaction, invoice_id: invoice_3.id, result: "success")
        create(:transaction, invoice_id: invoice_2.id, result: "failed")
        create(:invoice_item, unit_price: 11000, quantity: 4, invoice: invoice_1)
        create(:invoice_item, unit_price: 3000, quantity: 2, invoice: invoice_2)
        create(:invoice_item, unit_price: 6000, quantity: 3, invoice: invoice_3)

        expect(merchant.total_revenue_by_date(date)).to eq(18000)
      end
    end

    describe '#favorite_customer' do
      it 'returns the favorite customer for that merchant' do
        merchant = create(:merchant)
        customer_1, customer_2 = create_list(:customer, 2)
        create_list(:invoice, 3, customer: customer_1, merchant: merchant)
        create_list(:invoice, 2, customer: customer_2, merchant: merchant)
        Invoice.all.each do |invoice|
          create(:transaction, invoice: invoice)
        end

        expect(merchant.favorite_customer["first_name"]).to eq(customer_1.first_name)
        expect(merchant.favorite_customer["last_name"]).to eq(customer_1.last_name)
      end
    end
  end

  describe 'Class Methods' do
    describe '.most_revenue' do
      it 'returns the most revenue for a merchant' do
        merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3)
        invoice_1 = create(:invoice, merchant_id: merchant_1.id)
        invoice_2 = create(:invoice, merchant_id: merchant_2.id)
        invoice_3 = create(:invoice, merchant_id: merchant_3.id)
        create(:transaction, invoice_id: invoice_1.id, result: "success")
        create(:transaction, invoice_id: invoice_2.id, result: "success")
        create(:transaction, invoice_id: invoice_3.id, result: "success")
        create(:invoice_item, unit_price: 11000, quantity: 4, invoice: invoice_1)
        create(:invoice_item, unit_price: 12000, quantity: 5, invoice: invoice_2)
        create(:invoice_item, unit_price: 6000, quantity: 3, invoice: invoice_3)

        expect(Merchant.most_revenue(2).length).to eq(2)
        expect(Merchant.most_revenue(2).first.revenue).to eq(60000)
      end
    end

    describe '.most_items' do
      it 'returns the most items for a merchant' do
        merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3)
        invoice_1 = create(:invoice, merchant_id: merchant_1.id)
        invoice_2 = create(:invoice, merchant_id: merchant_2.id)
        invoice_3 = create(:invoice, merchant_id: merchant_3.id)
        create(:transaction, invoice_id: invoice_1.id, result: "success")
        create(:transaction, invoice_id: invoice_2.id, result: "success")
        create(:transaction, invoice_id: invoice_3.id, result: "success")
        create(:invoice_item, unit_price: 11000, quantity: 4, invoice: invoice_1)
        create(:invoice_item, unit_price: 12000, quantity: 5, invoice: invoice_2)
        create(:invoice_item, unit_price: 6000, quantity: 3, invoice: invoice_3)

        expect(Merchant.most_items(2).length).to eq(2)
        expect(Merchant.most_items(2).first.top_items).to eq(5)
        expect(Merchant.most_items(2).last.top_items).to eq(4)
      end
    end

    describe '.total_revenue_for_all_merchants' do
      it 'returns the total revenue across all merchants for a particular day' do
        merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3)
        date = Date.new(1969, 7, 20)
        invoice_1 = create(:invoice, created_at: date, merchant_id: merchant_1.id)
        invoice_2 = create(:invoice, merchant_id: merchant_2.id)
        invoice_3 = create(:invoice, created_at: date, merchant_id: merchant_3.id)
        create(:transaction, invoice_id: invoice_1.id, result: "success")
        create(:transaction, invoice_id: invoice_2.id, result: "success")
        create(:transaction, invoice_id: invoice_3.id, result: "success")
        create(:invoice_item, unit_price: 11000, quantity: 4, invoice: invoice_1)
        create(:invoice_item, unit_price: 3000, quantity: 2, invoice: invoice_2)
        create(:invoice_item, unit_price: 12000, quantity: 5, invoice: invoice_2)
        create(:invoice_item, unit_price: 6000, quantity: 3, invoice: invoice_3)

        expect(Merchant.overall_revenue(date)).to eq(62000)
      end
    end
  end
end
