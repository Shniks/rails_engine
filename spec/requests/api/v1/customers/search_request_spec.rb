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

  it "Can find multiple customers by first name" do
    first_name = "Nikhil"
    customers = create_list(:customer, 7, first_name: first_name)

    get "/api/v1/customers/find_all?first_name=#{first_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(7)
    customers.each do |customer|
      expect(customer["first_name"]).to eq(first_name)
    end
  end

  it "Can find multiple customers by last name" do
    last_name = "Shahi"
    customers = create_list(:customer, 7, last_name: last_name)

    get "/api/v1/customers/find_all?last_name=#{last_name}"

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(7)
    customers.each do |customer|
      expect(customer["last_name"]).to eq(last_name)
    end
    expect(customers.class).to eq(Array)
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

    get "/api/v1/customers/find?created_at=#{customers[7].created_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(customers[7].id)
    expect(customer["first_name"]).to eq(customers[7].first_name)
    expect(customer["last_name"]).to eq(customers[7].last_name)
  end

  it "Can find a list of customers by created at date" do
    created_at = "2018-04-30 22:45:00 UTC"
    create_list(:customer, 7)
    create_list(:customer, 2, created_at: created_at)
    customers = Customer.all

    get "/api/v1/customers/find_all?created_at=#{created_at}"

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(2)
    expect(customers.class).to eq(Array)
  end

  it "Can find a customer by its updated at date" do
    updated_at = "2018-04-30 22:45:00 UTC"
    create_list(:customer, 7)
    create_list(:customer, 2, updated_at: updated_at)
    customers = Customer.all

    get "/api/v1/customers/find?updated_at=#{customers[7].updated_at}"

    customer = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customer["id"]).to eq(customers[7].id)
    expect(customer["first_name"]).to eq(customers[7].first_name)
    expect(customer["last_name"]).to eq(customers[7].last_name)
  end

  it "Can find a list of customers by updated at date" do
    updated_at = "2018-04-30 22:45:00 UTC"
    create_list(:customer, 7)
    create_list(:customer, 4, updated_at: updated_at)
    customers = Customer.all

    get "/api/v1/customers/find_all?updated_at=#{updated_at}"

    customers = JSON.parse(response.body)

    expect(response).to be_successful
    expect(customers.count).to eq(4)
    expect(customers.class).to eq(Array)
  end
end
