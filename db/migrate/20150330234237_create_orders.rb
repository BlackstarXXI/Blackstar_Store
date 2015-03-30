class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :ordet_status
      t.decimal :pst_rate
      t.decimal :gst_rate
      t.decimal :hst_rate
      t.date :fill_date
      t.date :ship_date

      t.timestamps
    end
  end
end
