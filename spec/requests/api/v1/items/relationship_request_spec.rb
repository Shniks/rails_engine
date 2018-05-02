require 'rails_helper'

describe 'Items API relationships' do
  before(:each) do
    @item = create(:item)
  end

  it 'sends the associated merchant' do
    get "/api/v1/items/#{@item.id}/merchant"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(@item.merchant_id)
  end
end
