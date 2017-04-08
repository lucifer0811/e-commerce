class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :category_id, :sales, :descriptions,
    :list_product_popular_with_me
  has_many :image_products

  def list_product_popular_with_me
    list_products = []
    arrays = object.list_product_with_me
    arrays.each do |array|
      p = Product.find_by id: array
      images = p.image_products
      a = [p, images]
      list_products.push(a)
    end
    list_products
  end
end
