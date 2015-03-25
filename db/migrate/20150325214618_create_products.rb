class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.decimal :price
      t.string :stock_quantity

      t.timestamps
    end
  end
end
