require 'rails_helper'

describe 'Items Business Intelligence API' do
  before(:each) do
    merchant = create(:merchant)
    @items = create_list(:item, 5, merchant: merchant)
    create(:customer)

    @items.each_with_index do |item, index|
      invoices = create_list(:invoice, index+1, status: 'shipped')
      invoices.each do |invoice|
        create(:invoice_item, invoice: invoice, item: item)
      end
    end
  end

  it 'should return the top X items ranked by total revenue' do
    get "/api/v1/items/most_revenue?quantity=3"

    expect(response).to be_successful
    
    json = JSON.parse(response.body)

    expect(json.length).to be(3)
    expect(json.first['id']).to be(@items.last.id)
    expect(json.last['id']).to be(@items[-3].id)
  end

  it 'should return the top X items ranked by total number sold' do
    get "/api/v1/items/most_items?quantity=2"

    expect(response).to be_successful

    json = JSON.parse(response.body)

    expect(json.length).to be(2)
    expect(json.first['id']).to be(@items.last.id)
    expect(json.last['id']).to be(@items[-2].id)
  end

  it 'should return the most recent date with the most sales for a given item' do
    item = @items.last
    date = Date.new(1969, 7, 20)
    invoices = create_list(:invoice, 10, status: 'shipped', created_at: date)
    invoices.each do |invoice|
      create(:invoice_item, invoice: invoice, item: item)
    end

    get "/api/v1/items/#{item.id}/best_day"
    expected_date = date.to_datetime

    expect(response).to be_successful


    result = JSON.parse(response.body)
    expect(result['best_day']).to eq(expected_date.to_s)
  end
end
