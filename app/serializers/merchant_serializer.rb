class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :name, :num_items

  has_many :items

  def num_items
    object.items.count
  end
end
