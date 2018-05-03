FactoryBot.define do
  factory :invoice do
    customer
    merchant
    status "Mystring"
  end
end
