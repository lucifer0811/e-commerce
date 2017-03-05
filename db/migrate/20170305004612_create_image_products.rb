class CreateImageProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :image_products do |t|
      t.string :name
      t.string :photo
      t.integer :product_id

      t.timestamps
    end
  end
end
