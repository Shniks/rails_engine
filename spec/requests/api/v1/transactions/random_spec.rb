require 'rails_helper'

describe "Transactions Random API" do
  it 'Sends a random transaction' do
    create_list(:transaction, 5)
    
    get '/api/v1/transactions/random'

    transaction = JSON.parse(response.body)
    transaction_invoice_ids = Transaction.pluck(:invoice_id)

    expect(response).to be_successful
    expect(transaction_invoice_ids).to include(transaction["invoice_id"])
  end
end
