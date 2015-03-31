class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :telephone
      t.string :email
      t.string :street_address
      t.string :city
      t.string :province
      t.string :postal_code

      t.timestamps
    end
  end
end
