class Api::V1::Items::SearchController < ApplicationController
  def find
    render json: Item.find_by(item_params)
  end

  def find_all
    render json: Item.where(item_params)
  end

  def random
    render json: Item.all.sample
  end

  private

  def item_params
    params.permit(:id, :name, :unit_price)
  end
end