class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id, index: true
      t.integer :postage, default: 800
      t.string :name
      t.string :address
      t.string :postcode
      t.integer :payment_method, default: 0
      t.integer :status, default: 0
      t.integer :total_price

      t.timestamps
    end
  end
end
