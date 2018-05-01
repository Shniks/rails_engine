require 'rails_helper'

describe "Merchants Random API" do
  it 'Sends a random merchant' do
    Merchant.create(name: "Sergio")
    Merchant.create(name: "Nikhil")
    Merchant.create(name: "Tyler")

    get '/api/v1/merchants/random'

    merchant = JSON.parse(response.body)
    merchant_names = Merchant.pluck(:name)

    expect(response).to be_success
    expect(merchant_names).to include(merchant["name"])
  end
end
