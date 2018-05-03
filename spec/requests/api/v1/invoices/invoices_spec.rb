require 'rails_helper'

describe 'Invoices endpoints' do
  it 'should return a collection of invoices' do
    create_list(:invoice, 3)

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices = JSON.parse(response.body)

    expect(invoices.length).to be(3)
  end

  it 'should return a serialized invoice' do
    invoices = create_list(:invoice, 3)

    get "/api/v1/invoices/#{invoices.first.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)

    expect(invoice['id']).to be(invoices.first.id)
    expect(invoice['created_at']).to be_nil
    expect(invoice['updated_at']).to be_nil
  end
end
