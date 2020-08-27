class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,            null: false
      t.integer :price,           null: false
      t.text    :introduction,    null: false
      t.integer :item_condition,  null: false
      t.integer :potage_payer,    null: false
      t.integer :prefecture,      null: false
      t.integer :preparation_day, null: false
      t.integer :category,        null: false
      t.integer :brand,           null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
