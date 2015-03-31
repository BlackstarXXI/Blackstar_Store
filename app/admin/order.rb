ActiveAdmin.register Order do

  form do |f|
      f.inputs "Details" do
        f.input :customer_id, :as => :select, :collection => Hash[Customer.all.map{|c| [c.id.to_s + " - " + c.first_name + " " + c.last_name, c.id]}],
                :label => "Customer Number:"
        f.input :order_status, :as => :radio, :collection => ["pending", "paid", "filled", "shipped"], :label => "Order Status:"
        f.input :pst_rate, :label => "PST Rate:"
        f.input :gst_rate, :label => "GST Rate:"
        f.input :hst_rate, :label => "HST Rate:"
        f.input :fill_date, :label => "Order Fill Date:"
        f.input :ship_date, :label => "Order Shipped Date:"
      end
    f.actions   
  end
  
  show do |order|
    div do
      panel("Customer Information") do
        table_for(order.customer) do
          column :id
          column :first_name
          column :last_name
          column :street_address
          column :box_no
          column :postal_code
          column :phone_number
          column :email
        end
      end
      panel("Items") do
        
        table_for(order.order_product) do
          column :quantity
          column :id
          column "Vendor" do |item|
            item.product.vendor_name
          end
          column "Product Name" do |item|
            item.product.product_name
          end
          column "Description" do |item|
            item.product.short_desc
          end
          column "Price" do |item|
            number_to_currency(item.price)
          end
        end        
      end
      
      panel("Totals:") do
        table_for(order) do
          column "Subtotal" do
            number_to_currency(order.subtotal)
          end
            column "Total GST" do
              number_to_currency(order.total_gst)
          end
            column "Total PST" do
              number_to_currency(order.total_pst)
            end
            column "Total HST" do
              number_to_currency(order.total_hst)
            end
            column "Grand Total" do
              number_to_currency(order.grand_total)
            end
        end
      end
    end
  end
  
  index do
    column :id
    column "Customer" do |order|
      "#{order.customer.id} - #{order.customer.first_name} #{order.customer.last_name}"
    end
    column :order_status
    column :fill_date
    column :ship_date
    column :grand_total
    actions :defaults => true
  end
  
  
  def create
    @order = Order.new(permit_params)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_products = Order.order_products.all
  end
  
  def index
    @orders = Order.all
  end

  permit_params :customer_id, :order_status, :pst_rate, :gst_rate, :hst_rate, :fill_date
                :ship_date

end
