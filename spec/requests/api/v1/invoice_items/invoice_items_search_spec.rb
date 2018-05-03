require 'rails_helper'

describe 'Invoice Items Search API' do
  it 'should be able to find a single invoice item' do
    prices = [rand(500..10000), rand(500..1000), rand(500..1000)]

    prices.each do |price|
      create(:invoice_item, unit_price: price)
    end

    price_string = (InvoiceItem.first.unit_price / 100.0).to_f

    get "/api/v1/invoice_items/find?unit_price=#{price_string}"

    expect(response).to be_successful
    invoice = JSON.parse(response.body)

    expect(invoice['id']).to be(InvoiceItem.first.id)
  end

  it 'should be able to find multiple invoice items' do
    create_list(:invoice_item, 3, unit_price: 500)
    create(:invoice_item, unit_price: 10000)

    price_string = (InvoiceItem.first.unit_price / 100.0).to_f

    get "/api/v1/invoice_items/find_all?unit_price=#{price_string}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items.length).to be(3)
  end
end
