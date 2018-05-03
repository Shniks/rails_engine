require 'rails_helper'

describe 'Items API relationships' do
  before(:each) do
    @item = create(:item)
  end

  it 'Sends the associated merchant' do
    get "/api/v1/items/#{@item.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(@item.merchant_id)
  end

  it 'Sends a collection of associated invoice items' do
    create_list(:invoice_item, 7, item: @item)
    invoice_item_ids = @item.invoice_items.pluck(:id)

    get "/api/v1/items/#{@item.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items.count).to eq(7)
    invoice_items.each do |invoice_item|
      expect(invoice_item_ids).to include(invoice_item["id"])
    end
  end
end
