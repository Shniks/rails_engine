require 'rails_helper'

describe 'Transaction->Invoice API' do
  it 'should return the invoice of a specified transaction' do
    invoices = create_list(:invoice, 2)
    transaction = create(:transaction, invoice: invoices.first)
    create(:transaction, invoice: invoices.last)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice['id']).to be(invoices.first.id)
  end
end
