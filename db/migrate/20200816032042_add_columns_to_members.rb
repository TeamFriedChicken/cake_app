class AddColumnsToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :last_name, :string
    add_column :members, :first_name, :string
    add_column :members, :kana_last_name, :string
    add_column :members, :kana_first_name, :string
    add_column :members, :phone_number, :string
    add_column :members, :address, :string
    add_column :members, :postcode, :string
    add_column :members, :is_delete, :boolean, default: false
  end
end
