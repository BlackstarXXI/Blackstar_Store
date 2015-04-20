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

  def onsale
    @products = Product.where('price_status = "onsale"').all
  end

  def priceasc
    @products = Product.order(price: :asc ).all
  end
  
  def pricedesc
    @products = Product.order(price: :desc ).all
  end
  
  def nameasc 
    @products = Product.order(product_name: :asc).all
  end
  
  def namedesc
    @products = Product.order(product_name: :desc).all
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
