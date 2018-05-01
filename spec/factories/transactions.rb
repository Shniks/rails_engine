FactoryBot.define do
  factory :transaction do
    sequence :invoice_id { |n| n }
    sequence :credit_card_number { |n| n.to_s }
    credit_card_expiration_date "2018-05-01 07:19:34"
    result "success"
  end
end
