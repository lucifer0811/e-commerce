class Product < ApplicationRecord
  belongs_to :category
  has_many :image_products, dependent: :destroy
  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :name, presence: true, uniqueness: :true
  accepts_nested_attributes_for :image_products, allow_destroy: true

  def check_with_minsup?
    a = Float(self.orders.size)
    count_order = Float((Order.all.size))
    ((a/count_order) > Settings.minsup)
  end

  def list_product_popular products
    list_product = []
    products.each do |t|
      if t.check_with_minsup?
        list_product.push(t.id)
      end
    end
    list_product
  end
end
