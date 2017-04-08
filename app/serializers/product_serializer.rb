class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :category_id, :sales, :descriptions,
    :list_product_popular_with_me
  has_many :image_products

  def list_product_popular_with_me
    list_products = []
    arrays = DefPruning.new(Product.all, User.all).build_list_sequence(object.id)
    arrays.each do |array|
      p = Product.find_by id: array
      images = p.image_products
      a = [p, images]
      list_products.push(a)
    end
    list_products
  end
end
