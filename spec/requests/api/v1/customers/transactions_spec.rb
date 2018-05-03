require 'rails_helper'

describe 'Customer->Transactions API' do
  it 'should return a collection of a customers transactions' do
    customer_1, customer_2 = create_list(:customer, 2)
    invoices = create_list(:invoice, 3, customer: customer_1)
    create_list(:invoice, 5, customer: customer_2)

    invoices.each do |invoice|
      create(:transaction, invoice: invoice)
    end

    get "/api/v1/customers/#{customer_1.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)

    expect(transactions.length).to be(3)
  end
end
