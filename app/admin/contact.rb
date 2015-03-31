ActiveAdmin.register Contact do

  permit_params :name, :telephone, :email, :street_address, :city, :province, :postal_code,
                :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday

end
