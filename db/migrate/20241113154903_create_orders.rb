class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.string :label
      t.string :customer
      t.string :status

      t.timestamps
    end
    add_index :orders, :label, unique: true
  end
end
