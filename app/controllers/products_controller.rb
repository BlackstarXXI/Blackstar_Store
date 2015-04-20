class ProductsController < ApplicationController

  before_action :reset_category

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def bycategory
    session[:current_category] = params[:id]
    @products = Product.where('category_id = ?', params[:id]).page(params[:page]).per(4)
  end

  def brandnew
    @products = Product.where('inventory_status = "new"').all
  end

  def on_sale
    @products = Product.where('price_status = "onsale"').all
  end

  def priceasc
    @products = @products.sort {|p1,p2| p1.price <=> p2.price}
  end
  
  def pricedesc
    
    category = session[:current_category].to_i
    
    if category == 0
      @products = Product.order(price: :desc ).page(params[:page]).per(4)
    end
    
    if category == -1 
      @products = Product.where('inventory_status = "new"').order(price: :desc ).page(params[:page]).per(4)
    end
    
    if category == -2
      @products = Product.where('price_status = "onsale"').order(sale_price: :desc).page(params[:page]).per(4)
    end
    
    if category > 0
      @products = Product.where('category_id = ?', category).page(params[:page]).per(4)
    end    
    
  end
  
  def nameasc
    
    category = session[:current_category].to_i
    
    if category == 0
      @products = Product.order(product_name: :asc).page(params[:page]).per(4)
    end
    
    if category == -1 
      @products = Product.where('inventory_status = "new"').order(product_name: :asc ).page(params[:page]).per(4)
    end
    
    if category == -2
      @products = Product.where('price_status = "onsale"').order(product_name: :asc).page(params[:page]).per(4)
    end
    
    if category > 0
      @products = Product.where('category_id = ?', category).order(product_name: :asc).page(params[:page]).per(4)
    end    
    
  end
  
  def namedesc
    
    category = session[:current_category].to_i
    
    if category == 0
      @products = Product.order(product_name: :desc).page(params[:page]).per(4)
    end
    
    if category == -1 
      @products = Product.where('inventory_status = "new"').order(product_name: :desc ).page(params[:page]).per(4)
    end
    
    if category == -2
      @products = Product.where('price_status = "onsale"').order(product_name: :desc).page(params[:page]).per(4)
    end
    
    if category > 0
      @products = Product.where('category_id = ?', category).order(product_name: :desc).page(params[:page]).per(4)
    end    
    
  end

  def search_results
    wildcard_keywords = '%' + params[:search_keywords] + '%'
    @products = Product.where("product_name LIKE ?", wildcard_keywords)
  end

  protected
  
  def reset_category
    session[:current_category] = 0
  end

end
