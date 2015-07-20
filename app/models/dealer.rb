class Dealer < ActiveRecord::Base
	has_one :user
	has_and_belongs_to_many :products

	validates_presence_of :name, :address, :contact, :telephone
	validates_uniqueness_of :name
	
	has_paper_trail
end
