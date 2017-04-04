class UserOrder
  def initialize user
    @user = user
  end

  def list_order_for_user
    a = []
    @orders = Order.list_order_of_user @user.id
    @orders.each do |order|
      product_orders = ProductOrder.list_product_of_order order.id
      b = product_orders.map { |product_order| product_order.product_id  }
      a.push(b)
    end
    return a
  end
end
