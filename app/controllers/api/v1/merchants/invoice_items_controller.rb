class Api::V1::Merchants::InvoiceItemsController < ApplicationController
  def index
    render json: Merchant.find(params[:id]).invoices
  end
end