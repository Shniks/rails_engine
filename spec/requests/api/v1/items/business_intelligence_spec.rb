require 'rails_helper'

describe 'Items Business Intelligence API' do
  it 'should return the top X items ranked by total revenue' do
    items = create_list(:item, 5)
    create(:customer)
    create(:merchant)

    items.each_with_index do |item, index|
      invoices = create_list(:invoice, index+1)
      invoices.each do |invoice|
        create(:invoice_item, invoice: invoice, item: item)
      end
    end

    get "/api/v1/items/most_revenue?quantity=3"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.length).to be(3)

    expect(items.first['id']).to be(items.last.id)
    expect(items.last['id']).to be(items[3].id)
  end
end
