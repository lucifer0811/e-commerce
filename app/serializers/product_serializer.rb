class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :quantity, :category_id, :sales, :descriptions,
    :list_product_popular_with_me
  has_many :image_products

  def list_product_popular_with_me
    list_products = []
    arrays = object.list_product_with_me
    arrays.each do |array|
      p = Product.find_by id: array
      image_urls = []
      p.image_products.each do |image_product|
        image = {url: image_product.photo.url}
        image_urls.push(image)
      end
      product_details  = {id: p.id, name: p.name, price: p.price, sales: p.sales,
        descriptions: p.descriptions, category_id: p.category_id,
        images: image_urls}
      a = [product_details]
      product = {product: a}
      list_products.push(product)
    end
    if list_products.length > 3
      list_products = list_products.sample(3)
    end
    list_products
  end
end
