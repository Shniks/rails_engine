require 'rails_helper'

describe "Transactions/Find API" do
  before(:each) do
    @invoice = create(:invoice)
  end

  it "Can find a transaction by its invoice_id" do
    transaction_1 = create(:transaction, invoice_id: @invoice.id)

    get "/api/v1/transactions/find?invoice_id=#{transaction_1.invoice_id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["invoice_id"]).to eq(@invoice.id)
    expect(transaction["credit_card_number"]).to eq(transaction_1.credit_card_number)
  end

  it "Can find multiple transactions by invoice_id" do
    transactions = create_list(:transaction, 5, invoice_id: @invoice.id)

    get "/api/v1/transactions/find_all?invoice_id=#{@invoice.id}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions.count).to eq(5)
    transactions.each do |transaction|
      expect(transaction["invoice_id"]).to eq(@invoice.id)
    end
  end

  it "Can find a transaction by its credit_card_number" do
    transaction_1 = create(:transaction, invoice_id: @invoice.id)

    get "/api/v1/transactions/find?credit_card_number=#{transaction_1.credit_card_number}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["invoice_id"]).to eq(@invoice.id)
    expect(transaction["credit_card_number"]).to eq(transaction_1.credit_card_number)
  end

  it "Can find multiple transactions by credit card number" do
    credit_card_number = 454567
    transactions = create_list(:transaction, 5, credit_card_number: credit_card_number, invoice_id: @invoice.id)

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
    transaction_1 = Transaction.create!(credit_card_number: "34", credit_card_expiration_date: expiration_date_1, result: "success", invoice_id: @invoice.id)
    transaction_2 = Transaction.create!(credit_card_number: "24", credit_card_expiration_date: expiration_date_2, result: "failure", invoice_id: @invoice.id)

    get "/api/v1/transactions/find?credit_card_expiration_date=#{transaction_2.credit_card_expiration_date}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(transaction_2.id)
    expect(transaction["invoice_id"]).to eq(transaction_2.invoice_id)
    expect(transaction["credit_card_number"]).to eq(transaction_2.credit_card_number)
  end

  it "Can find multiple transactions by credit card expiration date" do
    expiration_date_1 = "2018-05-01 07:19:34"
    transactions = create_list(:transaction, 5, credit_card_expiration_date: expiration_date_1, invoice_id: @invoice.id)

    get "/api/v1/transactions/find_all?credit_card_expiration_date=#{expiration_date_1}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions.count).to eq(5)
  end

  it "Can find a transaction by its result" do
    expiration_date_1 = "2018-05-01 07:19:34"
    expiration_date_2 = "2017-05-01 07:19:34"
    transaction_1 = Transaction.create!(credit_card_number: "34", credit_card_expiration_date: expiration_date_1, result: "success", invoice_id: @invoice.id)
    transaction_2 = Transaction.create!(credit_card_number: "24", credit_card_expiration_date: expiration_date_2, result: "failure", invoice_id: @invoice.id)

    get "/api/v1/transactions/find?result=#{transaction_2.result}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(transaction_2.id)
    expect(transaction["invoice_id"]).to eq(transaction_2.invoice_id)
    expect(transaction["credit_card_number"]).to eq(transaction_2.credit_card_number)
  end

  it "Can find multiple transactions by result" do
    result = "success"
    transactions = create_list(:transaction, 5, result: result, invoice_id: @invoice.id)

    get "/api/v1/transactions/find_all?result=#{result}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions.count).to eq(5)
  end
end
