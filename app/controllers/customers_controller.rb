class CustomersController < ApplicationController

  def create
    
    @customer = Customer.new(customer_params)
    
    @customer.save
    
    redirect_to orders_new_path(:customer => @customer)
    
  end
  
  def new
    @customer = Customer.new
  end

  def customer_params
    params.require(:customer).permit(:province_id, :first_name, :last_name, :street_address, :box_no, :city,
                  :postal_code, :email, :phone_number)
    
  end
  

end
