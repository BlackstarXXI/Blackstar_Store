class CartController < ApplicationController
	def index
  end
  
  def items
    @cart_items = Product.find_all_by_id(session[:items])
    @sub_total = 0
    
    @cart_items.each_with_index do |c, i|
      
      if c.price_status == "onsale" then
        @sub_total += (c.sale_price * session[:quantities][i])
      else      
        @sub_total += (c.price * session[:quantities][i])
      end
    end
      
  end
  
  def add    
    id = params[:id]
    qty = params[:qty]
    session[:cart_items] += 1 unless session[:items].include?(id)
    session[:items] << id.to_i unless session[:items].include?(id)
    session[:quantities] << qty.to_i unless session[:items].include?(id)
    
    redirect_to root_path
  end
  
  def remove
  
  end
  
  def clear
    session[:cart_items] = 0
    session[:items] = []
    session[:quantities] = []
    redirect_to root_path
  end
end
