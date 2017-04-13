class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total, :user, :list_product

  def list_product
    list_products = []
    object.products.each do |product|
      product = {id: product.id, name: product.name, price: product.price,
        category_id: product.category_id}
      list_products.push(product)
    end
    list_products
  end

  def user
    user_id = object.user_id
    user = User.find_by id: user_id
    information_user = {name: user.name, address: user.address,
      phone_number: user.phone_number}
  end
end
