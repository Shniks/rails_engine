require 'rails_helper'

describe 'Invoices API Relationships' do
  before(:each) do
    @invoice = create(:invoice)
  end

  it 'Returns a collection of associated transactions' do
    create_list(:transaction, 5, invoice_id: @invoice.id)

    get "/api/v1/invoices/#{@invoice.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(trasactions.count).to eq(5)
  end
end
