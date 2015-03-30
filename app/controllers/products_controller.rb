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
    session[:current_category] = -1
    @products = Product.where('inventory_status = "new"').page(params[:page]).per(4)
  end

  def onsale
    session[:current_category] = -2
    @products = Product.where('price_status = "onsale"').page(params[:page]).per(4)
  end

  protected
  
  def reset_category
    session[:current_category] = 0
  end

end
