class Api::V1::Transactions::RandomController < ApplicationController
  def index
    render json:Transaction.all.sample(1).first
  end
end
