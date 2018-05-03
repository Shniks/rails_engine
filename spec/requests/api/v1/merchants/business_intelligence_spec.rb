require 'rails_helper'

describe "Merchant Business Intelligence Endpoints" do
  it 'Sends the total revenue for the merchant across successful transactions' do
    merchant = create(:merchant)
    invoice_1, invoice_2 = create_list(:invoice, 2, merchant: merchant)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "failed")
    create(:invoice_item, unit_price: 11000, quantity: 4, invoice: invoice_1)
    create(:invoice_item, unit_price: 3000, quantity: 2, invoice: invoice_2)

    get "/api/v1/merchants/#{merchant.id}/revenue"

    revenue = JSON.parse(response.body)

    expect(response).to be_successful
    expect(revenue).to eq({"revenue" => "440.00"})
  end

  it 'Sends the total revenue for the merchant across successful transactions' do
    merchant = create(:merchant)
    date = Date.new(1969, 7, 20)
    invoice_1, invoice_2 = create_list(:invoice, 2, merchant: merchant)
    invoice_3 = create(:invoice, created_at: date, merchant: merchant)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_3.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "failed")
    create(:invoice_item, unit_price: 11000, quantity: 4, invoice: invoice_1)
    create(:invoice_item, unit_price: 3000, quantity: 2, invoice: invoice_2)
    create(:invoice_item, unit_price: 6000, quantity: 3, invoice: invoice_3)

    get "/api/v1/merchants/#{merchant.id}/revenue?date=#{date}"

    revenue = JSON.parse(response.body)

    expect(response).to be_successful
    expect(revenue).to eq({"revenue" => "180.00"})
  end

  it 'Sends the top x merchants ranked by total revenue' do
    merchant_1, merchant_2, merchant_3 = create_list(:merchant, 3)
    invoice_1 = create(:invoice, merchant_id: merchant_1.id)
    invoice_2 = create(:invoice, merchant_id: merchant_2.id)
    invoice_3 = create(:invoice, merchant_id: merchant_3.id)
    create(:transaction, invoice_id: invoice_1.id, result: "success")
    create(:transaction, invoice_id: invoice_2.id, result: "success")
    create(:transaction, invoice_id: invoice_3.id, result: "success")
    create(:invoice_item, unit_price: 11000, quantity: 4, invoice: invoice_1)
    create(:invoice_item, unit_price: 3000, quantity: 2, invoice: invoice_2)
    create(:invoice_item, unit_price: 12000, quantity: 5, invoice: invoice_2)
    create(:invoice_item, unit_price: 6000, quantity: 3, invoice: invoice_3)

    get "/api/v1/merchants/most_revenue?quantity=2"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants.first["name"]).to eq(merchant_2.name)
    expect(merchants.last["name"]).to eq(merchant_3.name)
    expect(merchants.count).to eq(2)
  end
end
