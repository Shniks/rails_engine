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
    expect(merchant["id"]).to_not eq(merchant_1.id)
    expect(merchant["name"]).to eq(merchant_2.name)
    expect(merchant["name"]).to_not eq(merchant_3.name)
  end

  it "Can find a merchant by its id" do
    merchant_1 = Merchant.create(name: "Sergio")
    merchant_2 = Merchant.create(name: "Nikhil")
    merchant_3 = Merchant.create(name: "Tyler")

    get "/api/v1/merchants/find?id=#{merchant_3.id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(merchant_3.id)
    expect(merchant["id"]).to_not eq(merchant_1.id)
    expect(merchant["name"]).to eq(merchant_3.name)
    expect(merchant["name"]).to_not eq(merchant_2.name)
  end

  it "Can find a merchant by its created at date" do
    created_at = "2018-04-30 22:45:00 UTC"
    merchant_1 = Merchant.create(name: "Sergio")
    merchant_2 = Merchant.create(name: "Nikhil")
    merchant_3 = Merchant.create(name: "Tyler", created_at: created_at)

    get "/api/v1/merchants/find?created_at=#{merchant_3.created_at}"

    merchant_id = JSON.parse(response.body)["id"]
    merchant = Merchant.find(merchant_id)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(merchant_3.id)
    expect(merchant["id"]).to_not eq(merchant_1.id)
    expect(merchant["name"]).to eq(merchant_3.name)
    expect(merchant["name"]).to_not eq(merchant_2.name)
  end
end
