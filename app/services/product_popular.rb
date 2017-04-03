class ProductPopular
  def initialize products
    @products = products
  end

  def check_with_minsup? product
    a = Float(product.orders.size)
    count_order = Float((Order.all.size))
    ((a/count_order) > Settings.minsup)
  end

  def list_product_popular
    list_product = []
    @products.each do |t|
      if check_with_minsup? t
        list_product.push(t.id)
      end
    end
    list_product
  end
end
