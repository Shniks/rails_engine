class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number, :result
end
