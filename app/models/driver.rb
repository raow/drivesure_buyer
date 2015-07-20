#encoding: utf-8
class Driver < ActiveRecord::Base
	validates_presence_of :name, :certificate_type, :certificate_no, :address, :mobile
	paginates_per 20
	validates :mobile, mobile: true
	validates :certificate_no, certificate_no:true , if: :certificate_with_ID?

	has_paper_trail
	
	def certificate_with_ID?
	    certificate_type == "身份证"
	end
end
