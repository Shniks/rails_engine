require 'rails_helper'

describe "Transactions/Find API" do
  it "Can find a transaction by its invoice_id" do
    transactions = create_list(:transaction, 5)

    get "/api/v1/transactions/find?invoice_id=#{transactions[2].invoice_id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(transactions[2].id)
    expect(transaction["invoice_id"]).to eq(transactions[2].invoice_id)
    expect(transaction["credit_card_number"]).to eq(transactions[2].credit_card_number)
  end

  it "Can find a transaction by its credit_card_number" do
    transactions = create_list(:transaction, 5)

    get "/api/v1/transactions/find?credit_card_number=#{transactions[2].credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(transactions[2].id)
    expect(transaction["invoice_id"]).to eq(transactions[2].invoice_id)
    expect(transaction["credit_card_number"]).to eq(transactions[2].credit_card_number)
  end
end
