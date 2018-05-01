require 'rails_helper'

describe "Customers API" do
  it "Sends a list of customers" do
    create_list(:customer, 5)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)
    expect(customers.count).to eq(5)
  end

  it "Can get one customer by its id" do
    customers = create_list(:customer, 5)
    id = customers[2].id

    get "/api/v1/customers/#{id}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(id)
  end
end
