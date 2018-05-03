require 'rails_helper'

describe "Transactions API" do
  before(:each) do
    @invoice = create(:invoice)
  end

  it "Sends a list of transactions" do
    create_list(:transaction, 10, invoice_id: @invoice.id)

    get '/api/v1/transactions'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(10)
  end

  it "Can get one transaction by its id" do
    transactions = create_list(:transaction, 10, invoice_id: @invoice.id)
    id = transactions[6].id

    get "/api/v1/transactions/#{id}"

    transaction = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transaction["id"]).to eq(id)
  end
end
