require 'rails_helper'

describe 'Invoice Items Search API' do
  it 'should be able to find a single invoice item' do
    prices = [rand(500..10000), rand(500..1000), rand(500..1000)]

    prices.each do |price|
      create(:invoice_item, unit_price: price)
    end

    price_string = (InvoiceItem.first.unit_price / 100.0).to_f

    get "/api/v1/invoices/find?unit_price=#{price_string}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice.id).to be(InvoiceItem.first.id)
  end
end
