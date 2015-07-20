#encoding: utf-8
class CarModel < ActiveRecord::Base
	validates_presence_of :name
	validates :name, :uniqueness => true

	has_paper_trail
	
	default_scope { where(  'id  in  (' << User.current_user.dealer.products.pluck('products.car_model_id').map(&:inspect).join(',') << ')' ) unless User.current_user.is_admin }
end
