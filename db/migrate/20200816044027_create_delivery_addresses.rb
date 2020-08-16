class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer :member_id, index: true
      t.string :address
      t.integer :postcode
      t.string :name

      t.timestamps
    end
  end
end
