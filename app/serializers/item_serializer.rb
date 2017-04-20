class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image_url

  has_many :order_items
  has_many :orders, through: :order_items

end
