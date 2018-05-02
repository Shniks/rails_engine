class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :unit_price, :merchant_id, :merchant_name

  def unit_price
    '%.2f' % (object.unit_price.to_f / 100)
  end

  def merchant_name
    object.merchant.name
  end
end
