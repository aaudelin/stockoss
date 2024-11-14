class CreateLineItems < ActiveRecord::Migration[8.0]
  def change
    create_table :line_items do |t|
      t.string :label
      t.integer :quantity
      t.string :ram
      t.string :storage
      t.string :screen_size
      t.float :price
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
