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
end
