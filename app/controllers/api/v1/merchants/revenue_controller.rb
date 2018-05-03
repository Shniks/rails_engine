class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    if params[:date].nil?
      revenue = format('%.2f', Merchant.find(params[:id]).total_revenue / 1e2)
    else
      date = Date.parse(params[:date])
      revenue = format('%.2f', Merchant.find(params[:id]).total_revenue_by_date(date) / 1e2)
    end
    render json: { "revenue" => "#{revenue}"}
  end




end
