require 'rails_helper'

describe "Merchants API" do
  it "Sends a list of merchants" do
    create_list(:merchant, 5)

    get '/api/v1/merchants'

    expect(response).to be_success
  end
end
