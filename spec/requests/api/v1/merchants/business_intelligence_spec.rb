require 'rails_helper'

describe "Merchant Business Intelligence Endpoints" do
  it 'Sends the total revenue for the merchant across successful transactions' do
    merchant = create(:merchant)
    invoice_1 = create(:invoice)
    invoice_2 = create(:invoice)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "failed")
    create(:invoice_item, unit_price: 11000, quantity: 4, invoice: invoice_1)
    create(:invoice_item, unit_price: 3000, quantity: 2, invoice: invoice_2)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    revenue = JSON.parse(response.body)

    expect(response).to be_successful
    expect(revenue).to eq({"revenue" => "440.00"})
  end
end
