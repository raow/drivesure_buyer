class Product < ActiveRecord::Base
	belongs_to :car_model
	has_and_belongs_to_many :dealers

	validates_presence_of :name, :coverage_period, :coverage_mile, :car_model_id, :fee
	validates_uniqueness_of :name

	default_scope { where(  'products.id  in  (' << User.current_user.dealer.product_ids.map(&:inspect).join(',') << ')' ) unless User.current_user.is_admin }
	
	scope :by_car_models, ->(car_model_id) { where(:car_model_id => car_model_id.to_i) }

	has_paper_trail
end
