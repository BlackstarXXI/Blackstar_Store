class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :province_id
      t.string :first_name
      t.string :last_name
      t.string :street_address
      t.integer :box_no
      t.string :city
      t.string :postal_code
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
