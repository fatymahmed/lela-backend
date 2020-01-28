class CreateLineLists < ActiveRecord::Migration[6.0]
  def change
    create_table :line_lists do |t|
      t.integer :quantity
      t.integer :list_id
      t.integer :cart_id
      t.integer :order_id

      t.timestamps
    end
  end
end
