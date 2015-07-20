class Car < ActiveRecord::Base
	belongs_to :car_model
	has_one :driver
	has_many :services

	accepts_nested_attributes_for :driver
	validates_presence_of :vin, :purchase_at, :purchase_price, :current_mile, :car_model_id
	validates_uniqueness_of :vin
	validates :vin, :length => {:is => 17}
	paginates_per 20

	#scope :filter, ->(column_name, value, page) { distinct.joins(:services).where("#{column_name} like ? and (services.is_delete = 1 or (services.is_delete = 0 and ? > services.end_at)) and cars.id in (" << User.current_user.services.unscoped.ids.map(&:inspect).join(',') << ')', "%#{value}%" ,Time.now).limit(page) }

	has_paper_trail

	def self.filter(column_name, value, page)
		ids = User.current_user.services.unscoped.ids.map(&:inspect).join(',')
		car_sql = ids.length > 0 ? "and cars.id in (%s)" % ids : ""
		distinct.joins(:services).where("#{column_name} like ? and (services.is_delete = 1 or (services.is_delete = 0 and ? > services.end_at)) " + car_sql, "%#{value}%" ,Time.now).limit(page)
	end
end
