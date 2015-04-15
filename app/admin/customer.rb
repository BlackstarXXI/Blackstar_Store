ActiveAdmin.register Customer do

  form do |f|
    f.inputs "Details" do
    f.input :province_id, :as => :select, :collection => Province.all,
              :label => "Province:"
    f.input :first_name, :label => "First Name:"
    f.input :last_name, :label => "Last Name:"
    f.input :street_address, :label => "Street Address:"
    f.input :box_no, :label => "Box Number:"
    f.input :city, :label => "City:"
    f.input :postal_code, :label => "Postal Code:"
    f.input :email, :as => :email, :label => "Email Address:"
    f.input :phone_number, :as => :phone, :label => "Telephone Number:"
  end
    f.actions
  end
    
  
  def create
    @customer = Customer.new(permit_params)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end

  permit_params :first_name, :last_name, :street_address, :box_no, :city, :postal_code,
                :email, :phone_number, :province_id

end
