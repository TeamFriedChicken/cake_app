class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id, index: true
      t.integer :member_id, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
