class Api::V1::InvoiceItems::SearchController < ApplicationController
  def show
    render json: InvoiceItem
      .where(invoice_item_params)
      .order('id ASC')
      .limit(1)
      .first
  end

  def index
    render json: InvoiceItem.where(invoice_item_params)
  end

  private

  def invoice_item_params
    unless params[:unit_price].nil?
     params[:unit_price] = (100 * params[:unit_price].to_f).ceil
    end
    params.permit(:id, :unit_price, :quantity, :invoice_id, :item_id, :created_at, :updated_at)
  end
end
