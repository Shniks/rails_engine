class Api::V1::Merchants::RandomController < ApplicationController
  def index
    render json: Merchant.all.sample(1).first
  end
end
