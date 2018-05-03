require 'rails_helper'

describe 'Merchants->Invoices API' do
  it 'shoud return the invoices for a specific merchant' do
    merchant_1, merchant_2 = create_list(:merchant, 2)

    merchant_1_invoices = create_list(:invoice, 3, merchant: merchant_1)
    create_list(:invoice, 4, merchant: merchant_2)

    get "/api/v1/merchants/#{merchant_1.id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)
    expect(invoices.count).to be(3)
  end
end
