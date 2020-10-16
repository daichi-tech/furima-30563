class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,             null: false, maxlength: 40
      t.text :information,         null: false, maxlength: 1000
      t.integer :price,            null: false
      t.references :user,          null: false, foreign_key: true
      t.integer :category_id,      null: false
      t.integer :status_id,        null: false
      t.integer :delivery_fee_id,  null: false
      t.integer :delivery_date_id, null: false
      t.integer :prefecture_id,    null: false
      t.timestamps
    end
  end
end
