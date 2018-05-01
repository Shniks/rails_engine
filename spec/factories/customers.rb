FactoryBot.define do
  factory :customer do
    sequence :first_name { |n| "Tommy_#{n}" }
    sequence :last_name { |n| "Cruise_#{n}" }
  end
end
