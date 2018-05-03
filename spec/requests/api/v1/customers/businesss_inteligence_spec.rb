require 'rails_helper'

describe 'Customer business inteligence API' do
  it 'should return the customers favorite merchant' do
    customer = create(:customer)

    merchant_1, merchant_2 = create_list(:merchant, 2)

    create_list(:invoice, 3, customer: customer, merchant: merchant_1)
    create_list(:invoice, 2, customer: customer, merchant: merchant_2)

    Invoice.all.each do |invoice|
      create(:transaction, invoice: invoice)
    end

    get "/api/v1/customers/#{customer.id}/favorite_merchant"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)

    expect(merchant['id']).to be(merchant_1.id)
  end
end
