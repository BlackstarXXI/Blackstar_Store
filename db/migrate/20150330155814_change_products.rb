class ChangeProducts < ActiveRecord::Migration
  def change
  	add_column :products, :category_id, :integer
  	add_column :products, :sale_price, :decimal
  	add_column :products, :discount_rate, :decimal
  	add_column :products, :price_status, :string
  	add_column :products, :inventory_status, :string
  end
end
