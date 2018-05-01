require 'rails_helper'

describe "Customers Random API" do
  it 'Sends a random customer' do
    create_list(:customer, 10)

    get '/api/v1/customers/random'

    customer = JSON.parse(response.body)
    customer_first_names = Customer.pluck(:first_name)

    expect(response).to be_successful
    expect(customer_first_names).to include(customer["first_name"])
  end
end
