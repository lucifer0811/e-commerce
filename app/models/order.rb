class Order < ApplicationRecord
  before_validation :set_total!

  belongs_to :user
  has_many :product_orders
  has_many :products, through: :product_orders

  validates :total, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :user_id, presence: true
  validate :validates_product_order_with_quantity

  scope :list_order_of_user, ->(user_id) do
    where("user_id = ?", user_id)
  end

  def set_total!
    self.total = 0
    product_orders.each do |product_order|
      self.total += product_order.product.price * product_order.quantity
    end
  end

  def validates_product_order_with_quantity
    self.product_orders.each do |product_order|
      product = product_order.product
      if product_order.quantity > product.quantity
        errors["#{product.name}"] << "Is out of stock, just #{product.quantity} left"
      end
    end
  end

  def build_product_orders_with_product_ids_and_quantities product_ids_and_quantities
    product_ids_and_quantities.each do |product_id_and_quantity|
      id, quantity = product_id_and_quantity

      self.product_orders.build(product_id: id, quantity: quantity)
    end
  end
end
