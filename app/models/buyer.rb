#encoding: utf-8
class Buyer < ActiveRecord::Base
	validates_presence_of :name, :contact, :certificate_type, :certificate_no, :address, :mobile
	validates :email,  email: true, allow_blank: true
	validates :zip, zip: true, allow_blank: true
	validates :mobile, mobile: true
	validates :certificate_no, certificate_no:true , if: :certificate_with_ID?
	has_many :services

	has_paper_trail
	
	scope :filter, ->(column_name, value, page) { 
		#distinct.where("#{column_name} like ? and (services.is_delete = 1 or (services.is_delete = 0 and ? > services.end_at)) and cars.id in (" << User.current_user.services.unscoped.ids.map(&:inspect).join(',') << ')', "%#{value}%" ,Time.now).limit(page) \
		ids = User.current_user.services.unscoped.ids.map(&:inspect).join(',')
		buyer_sql = ids.length > 0 ? "buyers.mobile like (%s)" % ids : ""
		distinct.where( buyer_sql, "%#{value}%" ).limit(page)
	}
	scope :search, ->(search) { 
		ids = User.current_user.services.unscoped.ids.map(&:inspect).join(',')
		buyer_sql = ids.length > 0 ? "buyers.mobile like?" % ids : ""
		where(buyer_sql,"%#{search}%") if search.present? 
	} 


	def certificate_with_ID?
	    certificate_type == "身份证"
	end

	def self.filter(column_name, value, page)
		ids = User.current_user.services.unscoped.ids.map(&:inspect).join(',')
		buyer_sql = ids.length > 0 ? "buyers.mobile like (%s)" % ids : ""
		distinct.where( buyer_sql, "%#{value}%" ).limit(page)
	end
end
