require 'rails_helper'

describe "Transactions/Find API" do
  it "Can find a transaction by its invoice_id" do
    transactions = create_list(:transaction, 5)

    get "/api/v1/transactions/find?invoice_id=#{transactions[2].invoice_id}"

    binding.pry

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(merchant_2.id)
    expect(merchant["id"]).to_not eq(merchant_1.id)
    expect(merchant["name"]).to eq(merchant_2.name)
    expect(merchant["name"]).to_not eq(merchant_3.name)
  end
end
