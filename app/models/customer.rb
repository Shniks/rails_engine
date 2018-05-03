class Customer < ApplicationRecord
  validates_presence_of :first_name, :last_name

  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    Merchant
      .joins(invoices: [:transactions])
      .where(transactions: {result: 'success'}, invoices: {customer_id: id})
      .select('merchants.*, COUNT(transactions) AS transaction_count')
      .group(:id)
      .order('transaction_count DESC')
      .limit(1)
      .first
  end
end
