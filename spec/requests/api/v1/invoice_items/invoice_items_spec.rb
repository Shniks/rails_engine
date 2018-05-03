require 'rails_helper'

describe 'Invoice Items API' do
  it 'should return a collection of invoice items' do
    create_list(:invoice_item, 3)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)

    expect(invoice_items.count).to be(3)
  end

  it 'should return a single serialized invoice item' do
    items = create_list(:invoice_item, 3)

    get "/api/v1/invoice_items/#{items.first.id}"

    expect(response).to be_successful

    invoice_item = JSON.parse(response.body)

    expect(invoice_item['id']).to be(items.first.id)
    expect(invoice_item['created_at']).to be_nil
    expect(invoice_item['updated_at']).to be_nil
  end
end
