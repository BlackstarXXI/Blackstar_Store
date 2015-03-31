class Customer < ActiveRecord::Base
	has_many :orders
	belongs_to :provice

	validates :first_name, :last_name, :city, :postal_code, :email, presence: true
end
