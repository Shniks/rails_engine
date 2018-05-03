require 'csv'

namespace :import do
  desc 'Seed The Database'
  task all: :environment do
    puts 'Loading requisite CSV files. Be right back!'
    puts 'Loading merchants...'
    load_merchants
    puts 'Loading transactions...'
    puts 'Loading customers...'
    load_customers
    puts 'Loading invoices...'
    load_invoices
    load_transactions
    puts 'Loading items...'
    load_items
    puts 'Loading invoice items...'
    load_invoice_items
    puts 'All CSV files loaded and ready to use.'
  end

  def load_merchants
    CSV.foreach('db/csv/merchants.csv', headers: true, header_converters: :symbol) do |row|
      Merchant.create!(row.to_hash)
    end
  end

  def load_transactions
    CSV.foreach('db/csv/transactions.csv', headers: true, header_converters: :symbol) do |row|
      Transaction.create!(row.to_hash)
    end
  end

  def load_customers
    CSV.foreach('db/csv/customers.csv', headers: true, header_converters: :symbol) do |row|
      Customer.create!(row.to_hash)
    end
  end

  def load_items
    CSV.foreach('db/csv/items.csv', headers: true, header_converters: :symbol) do |row|
      Item.create!(row.to_hash)
    end
  end

  def load_invoices
    CSV.foreach('db/csv/invoices.csv', headers: true, header_converters: :symbol) do |row|
      Invoice.create!(row.to_hash)
    end
  end

  def load_invoice_items
    CSV.foreach('db/csv/invoice_items.csv', headers: true, header_converters: :symbol) do |row|
      InvoiceItem.create!(row.to_hash)
    end
  end

end
