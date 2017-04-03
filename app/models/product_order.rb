class ProductOrder < ApplicationRecord
  after_create :decrement_product_quantity!

  belongs_to :order, inverse_of: :product_orders
  belongs_to :product, inverse_of: :product_orders

  def decrement_product_quantity!
    self.product.decrement!(:quantity, quantity)
  end

  scope :list_product_of_order, ->(order_id) do
    where("order_id = ?", order_id)
  end
end
