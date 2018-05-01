FactoryBot.define do
  factory :item do
    sequence(:name) { |n| n }
    description 'This is a description'
    unit_price 500
    merchant
  end
end
