require 'rails_helper'

describe Item, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:unit_price) }

  it { is_expected.to belong_to(:merchant) }


  context 'Methods' do
    describe '.most_revenue' do
      it 'should return the X items with the most revenue' do
        merchant = create(:merchant)
        items = create_list(:item, 5, merchant: merchant)
        create(:customer)
        items.each_with_index do |item, index|
          invoices = create_list(:invoice, index+1, status: 'shipped')
          invoices.each do |invoice|
            create(:invoice_item, invoice: invoice, item: item)
          end
        end

        result = Item.most_revenue(3)
        
        expect(result.length).to be(3)
        expect(result.first).to eq(items.last)
        expect(result.last).to eq(items[-3])
      end
    end
  end
end
