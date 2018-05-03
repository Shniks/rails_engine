class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices

  def self.total_revenue
    Invoice.joins(:invoice_items, :transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .sum("invoice_items.quantity*invoice_items.unit_price")
  end
end
