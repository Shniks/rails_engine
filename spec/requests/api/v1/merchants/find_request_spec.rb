require 'rails_helper'

describe "Merchants/Find API" do
  it "Can find a merchant by its name" do
    merchant_1 = Merchant.create(name: "Sergio")
    merchant_2 = Merchant.create(name: "Nikhil")
    merchant_3 = Merchant.create(name: "Tyler")
    
    get "/api/v1/merchants/find?name=#{merchant_2.name}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(merchant_2.id)
    expect(merchant["name"]).to eq(merchant_2.name)
  end
end
