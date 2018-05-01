require 'rails_helper'

describe 'Items API' do
  it 'sends a list of items' do
    merchant = create(:merchant)
    count = 5

    create_list(:item, count, merchant: merchant)

    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items.count).to be(count)
  end

  it 'sends a single item' do
    merchant = create(:merchant)
    count = 5

    create_list(:item, count, merchant: merchant)

    id = Item.last.id
    get "/api/v1/items/#{id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(item['id']).to be(id)
  end
end