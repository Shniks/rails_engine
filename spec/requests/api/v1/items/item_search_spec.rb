require 'rails_helper'

describe 'Items search API' do
  it 'should be able to find an item by name' do
    merchant = create(:merchant)
    create_list(:item, 3, merchant: merchant)

    item_1 = create(:item, merchant: merchant, name: 'The Item')

    get "/api/v1/items/find?name=#{item_1.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body)

    expect(item['id']).to be(item_1.id)
    expect(item['name']).to be(item_1.name)
  end
end