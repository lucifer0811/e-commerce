class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :descriptions
      t.float :sales, default: 0.0
      t.integer :quantity
      t.integer :category_id

      t.timestamps
    end
  end
end
