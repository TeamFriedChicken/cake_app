class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id, index: true
      t.integer :item_id, index: true
      t.integer :status, default: 0
      t.integer :quantity
      t.integer :purchase

      t.timestamps
    end
  end
end
