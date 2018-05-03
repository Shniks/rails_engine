class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  def total_revenue
    Invoice.joins(:invoice_items, :transactions)
    .where(transactions: {result: "success"}, merchant_id: id)
    .sum("invoice_items.quantity*invoice_items.unit_price")
  end

  def total_revenue_by_date(date)
    Invoice.joins(:invoice_items, :transactions)
    .where(transactions: {result: "success"}, merchant_id: id, created_at: date.beginning_of_day..date.end_of_day)
    .sum("invoice_items.quantity*invoice_items.unit_price")
  end
end
