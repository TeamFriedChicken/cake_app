class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, index: true
      t.string :name
      t.string :image_id
      t.integer :price
      t.text :explanation
      t.boolean :status

      t.timestamps
    end
  end
end
