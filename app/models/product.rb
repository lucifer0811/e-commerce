class Product < ApplicationRecord
  belongs_to :category
  has_many :image_products, dependent: :destroy
  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :name, presence: true, uniqueness: :true
  accepts_nested_attributes_for :image_products, allow_destroy: true

  scope :search_by_name, lambda {|search|
    where("lower(name) LIKE ?", "%#{search.downcase}%" )
  }

  def list_product_with_me
    array_result = []
    $list_results.each do |array_list|
      if (array_list.length >= 2 && array_list.include?(self.id))
        array_id = [self.id]
        c = array_list - array_id
        c.each do |t|
          array_result.push(t)
        end
      end
    end
    $list_results.each do |array_list|
      if (array_list.length >= 2 && array_list.include?([self.id]))
        array_id = [self.id]
        c = array_list - array_id
        c.each do |t|
          t.each do |r|
            array_result.push(r)
          end
        end
      end
    end
    array_result = array_result.uniq - [self.id]
  end
end
