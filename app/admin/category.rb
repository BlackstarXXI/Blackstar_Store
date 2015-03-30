ActiveAdmin.register Category do

  def create
    @category = Category.new(permit_params)
  end

  permit_params :name
  
end
