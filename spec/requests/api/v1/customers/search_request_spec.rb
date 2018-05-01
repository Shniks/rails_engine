require 'rails_helper'

describe "Customers/Find API" do
  it "Can find a customer by its first name" do
    customers = create_list(:customer, 7)

    get "/api/v1/customers/find?first_name=#{customers[4].first_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(customers[4].id)
    expect(customer["first_name"]).to eq(customers[4].first_name)
    expect(customer["last_name"]).to eq(customers[4].last_name)
  end

  it "Can find a customer by its last name" do
    customers = create_list(:customer, 7)

    get "/api/v1/customers/find?last_name=#{customers[4].last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(customers[4].id)
    expect(customer["first_name"]).to eq(customers[4].first_name)
    expect(customer["last_name"]).to eq(customers[4].last_name)
  end

  it "Can find a customer by its created at date" do
    created_at = "2018-04-30 22:45:00 UTC"
    create_list(:customer, 7)
    create_list(:customer, 2, created_at: created_at)
    customers = Customer.all

    get "/api/v1/customers/find?last_name=#{customers[7].last_name}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(customers[7].id)
    expect(customer["first_name"]).to eq(customers[7].first_name)
    expect(customer["last_name"]).to eq(customers[7].last_name)
  end
end


# created_at = "2018-04-30 22:45:00 UTC"
# merchant_1 = Merchant.create(name: "Sergio")
# merchant_2 = Merchant.create(name: "Nikhil")
# merchant_3 = Merchant.create(name: "Tyler", created_at: created_at)
#
# get "/api/v1/merchants/find?created_at=#{merchant_3.created_at}"
#
# merchant_id = JSON.parse(response.body)["id"]
# merchant = Merchant.find(merchant_id)
#
# expect(response).to be_successful
# expect(merchant["id"]).to eq(merchant_3.id)
# expect(merchant["id"]).to_not eq(merchant_1.id)
# expect(merchant["name"]).to eq(merchant_3.name)
# expect(merchant["name"]).to_not eq(merchant_2.name)
