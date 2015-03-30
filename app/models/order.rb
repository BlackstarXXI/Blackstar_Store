class Order < ActiveRecord::Base
	belongs_to :customer

	validates :order_status, presence: true
	validates_inclusion_of :order_status, :in => ["pending", "paid", "filled", "shipped"]
end
