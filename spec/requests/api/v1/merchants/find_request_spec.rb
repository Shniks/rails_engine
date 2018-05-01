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

  it "Can find multiple merchants by name" do
    name = "Cummings-Thiel"
    create_list(:merchant, 5, name: name)

    get "/api/v1/merchants/find_all?name=#{name}"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants.count).to eq(5)
    merchants.each do |merchant|
      expect(merchant["name"]).to eq(name)
    end
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

  it "Can find a list of merchants with the same created at date" do
    created_at = "2018-04-30 22:45:00 UTC"
    create_list(:merchant, 4, created_at: created_at)
    Merchant.create(name: "Sergio")

    get "/api/v1/merchants/find_all?created_at=#{created_at}"

    merchants = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchants.count).to eq(4)
  end

  it "Can find a merchant by its updated at date" do
    updated_at = "2018-04-30 20:45:00 UTC"
    merchant_1 = Merchant.create(name: "Sergio")
    merchant_2 = Merchant.create(name: "Nikhil", updated_at: updated_at)
    merchant_3 = Merchant.create(name: "Tyler")

    get "/api/v1/merchants/find?updated_at=#{merchant_2.updated_at}"

    merchant_id = JSON.parse(response.body)["id"]
    merchant = Merchant.find(merchant_id)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(merchant_2.id)
    expect(merchant["id"]).to_not eq(merchant_1.id)
    expect(merchant["name"]).to eq(merchant_2.name)
    expect(merchant["name"]).to_not eq(merchant_3.name)
  end
end
