class ProductOrder < ApplicationRecord
  after_create :decrement_product_quantity!

  belongs_to :order, inverse_of: :product_orders
  belongs_to :product, inverse_of: :product_orders

  def decrement_product_quantity!
    self.product.decrement!(:quantity, quantity)
  end
end
