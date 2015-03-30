ActiveAdmin.register Product do

  form do |f|
      f.inputs "Details" do
        f.input :category_id, :as => :select, :collection => Category.all
        f.input :product_name, :label => "Product Name:"
        f.input :description, :label => "Description:"
        f.input :price, :label => "Regular Price:"
        f.input :sale_price, :label => "Sale Price:"
        f.input :discount_rate, :label => "Discount Rate"
        f.input :stock_quantity, :label => "Stock Quantity:"
        f.input :price_status, :as => :radio,
                :collection => ["regular", "onsale", "discount"]
        f.input :inventory_status, :as => :radio,
                :collection => ["new", "instock", "discontinued"]
        f.input :image
      end
      f.actions
    end
  
  def create
    @product = Product.new(permit_params)
  end
  
  def index
    @products = Product.all
  end
  
  permit_params :category_id, :product_name, :description, :price, :sale_price,  :discount_rate, :stock_quantity, :price_status, :inventory_status, :image

end
