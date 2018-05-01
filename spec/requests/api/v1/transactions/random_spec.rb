require 'rails_helper'

describe "Transactions Random API" do
  it 'Sends a random transaction' do
    Transaction.create!(invoice_id: 12, credit_card_number: "3456", credit_card_expiration_date: "2018-05-01 07:19:34", result: "success")
    Transaction.create!(invoice_id: 13, credit_card_number: "3456", credit_card_expiration_date: "2018-05-01 07:19:34", result: "success")
    Transaction.create!(invoice_id: 14, credit_card_number: "3456", credit_card_expiration_date: "2018-05-01 07:19:34", result: "success")

    get '/api/v1/transactions/random'

    transaction = JSON.parse(response.body)
    transaction_invoice_ids = Transaction.pluck(:invoice_id)

    expect(response).to be_successful
    expect(transaction_invoice_ids).to include(transaction["invoice_id"])
  end
end
