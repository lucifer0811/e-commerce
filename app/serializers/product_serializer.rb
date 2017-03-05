class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :category_id, :sales, :descriptions
  has_many :image_products
end
