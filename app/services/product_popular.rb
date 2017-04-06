class ProductPopular
  def initialize products, users
    @products = products
    @users = users
  end

  def check_with_min_sup? a, b
    (Float(a)/Float(b)) > Settings.minsup
  end

  def list_product_popular
    list_product = []
    @products.each do |t|
      count = 0
      @users.each do |user|
        list_of_products = UserOrder.new(user).list_order_for_user
        list_of_products.each do |list_of_product|
          if list_of_product.include?(t.id)
            count = count +1
            break
          end
        end
      end
      if check_with_min_sup? count, @users.length
        list_product.push(t.id)
      end
    end
    list_product
  end
end
