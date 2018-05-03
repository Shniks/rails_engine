require 'rails_helper'

describe 'Customer->Invoices API' do
  it 'should return a collection of invoices' do
    customer_1, customer_2 = create_list(:customer, 2)

    customer_1.invoices = create_list(:invoice, 3)
    customer_2.invoices = create_list(:invoice, 5)

    get "/api/v1/customers/#{customer_1.id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.length).to be(3)
  end
end
