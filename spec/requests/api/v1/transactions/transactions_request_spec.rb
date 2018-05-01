require 'rails_helper'

describe "Transactions API" do
  it "Sends a list of transactions" do
    create_list(:transaction, 10)

    get '/api/v1/transactions'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(10)
  end

  # it "Can get one merchant by its id" do
  #   merchants = create_list(:merchant, 5)
  #   id = merchants[2].id
  #
  #   get "/api/v1/merchants/#{id}"
  #
  #   merchant = JSON.parse(response.body)
  #
  #   expect(response).to be_successful
  #   expect(merchant["id"]).to eq(id)
  # end
end
