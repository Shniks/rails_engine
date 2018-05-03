class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    revenue = Merchant.total_revenue
    check = { "revenue" => "#{revenue.values.first}"}
    binding.pry
  end




end
