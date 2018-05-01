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

  it "Can find multiple transactions by invoice_id" do
    invoice_id = 3
    transactions = create_list(:transaction, 5, invoice_id: invoice_id)

    get "/api/v1/transactions/find_all?invoice_id=#{invoice_id}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions.count).to eq(5)
    transactions.each do |transaction|
      expect(transaction["invoice_id"]).to eq(invoice_id)
    end
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

  it "Can find multiple transactions by credit card number" do
    credit_card_number = 454567
    transactions = create_list(:transaction, 5, credit_card_number: credit_card_number)

    get "/api/v1/transactions/find_all?credit_card_number=#{credit_card_number}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions.count).to eq(5)
    transactions.each do |transaction|
      expect(transaction["credit_card_number"]).to eq(credit_card_number.to_s)
    end
  end

  it "Can find a transaction by its credit_card_expiration_date" do
    expiration_date_1 = "2018-05-01 07:19:34"
    expiration_date_2 = "2017-05-01 07:19:34"
    transaction_1 = Transaction.create!(invoice_id: 2, credit_card_number: "34", credit_card_expiration_date: expiration_date_1, result: "success")
    transaction_2 = Transaction.create!(invoice_id: 76, credit_card_number: "24", credit_card_expiration_date: expiration_date_2, result: "failure")

    get "/api/v1/transactions/find?credit_card_expiration_date=#{transaction_2.credit_card_expiration_date}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(transaction_2.id)
    expect(transaction["invoice_id"]).to eq(transaction_2.invoice_id)
    expect(transaction["credit_card_number"]).to eq(transaction_2.credit_card_number)
  end

  it "Can find a transaction by its result" do
    expiration_date_1 = "2018-05-01 07:19:34"
    expiration_date_2 = "2017-05-01 07:19:34"
    transaction_1 = Transaction.create!(invoice_id: 2, credit_card_number: "34", credit_card_expiration_date: expiration_date_1, result: "success")
    transaction_2 = Transaction.create!(invoice_id: 76, credit_card_number: "24", credit_card_expiration_date: expiration_date_2, result: "failure")

    get "/api/v1/transactions/find?result=#{transaction_2.result}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(transaction_2.id)
    expect(transaction["invoice_id"]).to eq(transaction_2.invoice_id)
    expect(transaction["credit_card_number"]).to eq(transaction_2.credit_card_number)
  end
end
