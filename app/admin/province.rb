ActiveAdmin.register Province do

  def create
    @province = Province.new
  end

  permit_params :name, :pst_rate, :gst_rate, :hst_rate

end
