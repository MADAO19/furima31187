class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :municipal_district, null: false
      t.string :address, null: false
      t.string :building_name, null: false
      t.string :phone_number, null: false
      t.references :purchase_after, foreign_key: true
      t.timestamps
    end
  end
end
