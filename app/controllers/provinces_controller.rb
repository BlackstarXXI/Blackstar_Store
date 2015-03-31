class ProvincesController < ApplicationController

  def create
    @province = Province.create(province_params)
  end
  
  def new
    @province = Province.new
  end
  
  protected
  
  def province_params
    params.require(:province).permit(:name, :pst_rate, :gst_rate, :hst_rate)
  end
  
end
