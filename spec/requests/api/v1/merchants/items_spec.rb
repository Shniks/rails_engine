require 'rails_helper'

describe 'Merchant->Items API', type: :request do
  it 'should return the items for a specific merchant' do
    merchant_1, merchant_2 = create_list(:merchant, 2)

    merchant_1_items = create_list(:item, 3, merchant: merchant_1)
    create_list(:item, 3, merchant: merchant_2)

    get "/api/v1/merchants/#{merchant_1.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items.count).to be(3)
  end
end