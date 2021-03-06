class Product < ActiveRecord::Base
	belongs_to :category

	validates :product_name, :description, :price, :stock_quantity, presence: true

	mount_uploader :image, ProductImageUploader
end
