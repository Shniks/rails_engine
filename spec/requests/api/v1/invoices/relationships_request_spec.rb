require 'rails_helper'

describe 'Invoices API Relationships' do
  before(:each) do
    @invoice = create(:invoice)
  end

  it 'Returns a collection of associated transactions' do
    create_list(:transaction, 5, invoice_id: @invoice.id)

    get "/api/v1/invoices/#{@invoice.id}/transactions"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions.count).to eq(5)
  end

  it 'Returns a collection of associated invoice items' do
    create_list(:invoice_item, 4, invoice: @invoice)

    get "/api/v1/invoices/#{@invoice.id}/invoice_items"

    invoice_items = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_items.count).to eq(4)
    invoice_items.each do |invoice_item|
      expect(invoice_item["invoice_id"]).to eq(@invoice.id)
    end
  end
end
