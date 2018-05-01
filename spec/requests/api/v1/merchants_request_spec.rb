require 'rails_helper'

describe "Merchants API" do
  it "Sends a list of merchants" do
    create_list(:merchant, 5)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants.count).to eq(5)
  end

  it "Can get one merchant by its id" do
    merchants = create_list(:merchant, 5)
    id = merchants[2].id

    get "/api/v1/merchants/#{id}"

    merchant = JSON.parse(response.body)

    expect(response).to be_successful
    expect(merchant["id"]).to eq(id)
  end
end
