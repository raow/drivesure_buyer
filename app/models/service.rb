class Service < ActiveRecord::Base
	belongs_to :car
	belongs_to :product
	belongs_to :dealer
	belongs_to :buyer
	belongs_to :user 
	accepts_nested_attributes_for :car
	accepts_nested_attributes_for :buyer
	
	validates_presence_of :total_fee, :issue_at, :saler

	paginates_per 20

	before_create :set_attr

	default_scope { where(is_delete: false) unless User.current_user.is_admin }

	scope :search, ->(search) { where("no like ?  or cars.license_no like ?  or  cars.vin like ?","%#{search}%","%#{search}%","%#{search}%") if search.present? } 

	scope :by_car_models, ->(car_model) { where(" car_models.id = ?","#{car_model}") if car_model.present? }

	has_paper_trail
	
	def set_attr
  		self.no = 'WAR' << Time.now.strftime('%Y%m%d%H%M%S%L').to_s
  		self.start_at = self.issue_at + 1.days
  		self.end_at = self.start_at + self.product.coverage_period.months
  	end

  	def init_car
  		car = Car.includes(:services).where("(services.is_delete = 1 or (services.is_delete = 0 and ? > services.end_at)) and cars.vin = ?",Time.now,self.car.vin).references(:services).first
		if car 
			car.driver.attributes =  self.car.driver.attributes.except('id')
			car.attributes = self.car.attributes.except('id')
			self.car = car
		end
  	end
end
