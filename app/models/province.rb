class Province < ActiveRecord::Base
	has_many :customer
	
	validates :name, :gst_rate, :pst_rate, :hst_rate, presence: true
	
	validates :pst_rate, :gst_rate, :hst_rate, numericality: {less_than_or_equal_to: 0.5, greater_than_or_equal_to: 0}
end
