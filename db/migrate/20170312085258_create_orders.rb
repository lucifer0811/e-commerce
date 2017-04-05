class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :status
      t.datetime :deleted_time
      t.float :total
      t.integer :numberProduct
      t.integer :user_id

      t.timestamps
    end
  end
end