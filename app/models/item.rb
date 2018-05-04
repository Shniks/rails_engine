class Item < ApplicationRecord
  validates_presence_of :name, :description, :unit_price

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.most_revenue(quantity)
    joins(:invoice_items, :invoices)
      .where(invoices: {status: 'shipped'})
      .select('items.*, SUM(invoice_items.quantity*invoice_items.unit_price) AS revenue')
      .group(:id)
      .order('revenue DESC')
      .limit(quantity)
  end
end
