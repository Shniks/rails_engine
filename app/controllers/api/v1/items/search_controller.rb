class Api::V1::Items::SearchController < ApplicationController
  def show
    render json: Item
      .where(item_params)
      .order('id ASC')
      .limit(1)
      .first
  end

  def index
    render json: Item.where(item_params)
  end

  private

  def item_params
    unless params[:unit_price].nil?
     params[:unit_price] = (100 * params[:unit_price].to_f).ceil
    end
    params.permit(:id, :name, :unit_price, :created_at, :updated_at, :description, :merchant_id)
  end
end
