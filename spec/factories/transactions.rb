FactoryBot.define do
  factory :transaction do
    invoice_id 1
    credit_card_number "MyString"
    credit_card_expiration_date "2018-05-01 07:19:34"
    result "success"
  end
end
