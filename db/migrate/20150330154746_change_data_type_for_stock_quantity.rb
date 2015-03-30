class ChangeDataTypeForStockQuantity < ActiveRecord::Migration
  def change
  	change_column :products, :stock_quantity,  :decimal
  end
end
