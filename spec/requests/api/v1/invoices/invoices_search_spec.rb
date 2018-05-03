require 'rails_helper'

describe 'Invoices Search API' do
  it 'should be able to find a single invoice' do
    invoices = create_list(:invoice, 3)

    get "/api/v1/invoices/find?customer_id=#{invoices.first.customer_id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice['id']).to be(invoices.first.id)
  end

  it 'should be able to find multiple invoices' do
    create_list(:customer, 2)
    invoices = create_list(:invoice, 3, customer_id: 1)
    create_list(:invoice, 4, customer_id: 2)

    get "/api/v1/invoices/find_all?customer_id=#{invoices.first.customer_id}"

    expect(response).to be_successful

    invoice_list = JSON.parse(response.body)

    expect(invoice_list.length).to be(3)
  end
end
