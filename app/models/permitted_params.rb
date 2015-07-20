class PermittedParams < Struct.new(:params)
	def service
		params.require(:service).permit( :issue_at, :product_id, :total_fee, :saler, :pdi,
      	car_attributes: [ :license_no, :vin, :purchase_at, :purchase_price, :ein, :car_model_id, :current_mile,
      	driver_attributes: [ :name, :phone, :mobile, :company_code, :address, :certificate_type, :certificate_no, :address] ],
      	buyer_attributes: [ :name, :contact, :email, :is_caa_vip, :certificate_type, :certificate_no, :zip, :phone, :mobile, :address])
	end

  def service_create
      params.require(:service).permit( :issue_at, :product_id, :total_fee, 
        buyer_attributes: [ :name, :contact, :email, :is_caa_vip, :certificate_type, :certificate_no, :zip, :phone, :mobile, :address])
  end

	def product
	  params.require(:product).permit( :coverage_period, :coverage_mile, :name, :fee, :car_model_id, :once_reparation, :total_reparation, :dealer_ids=>[])
	end

	def car_model
    params.require(:car_model).permit(:name, :description)
  end

  def car
    params.require(:car).permit(:license_no, :vin, :purchase_at, :purchase_price, :ein, :model, :current_mile, :car_model_id)
  end

  def user
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :dealer_id)
  end

  def dealer
    params.require(:dealer).permit(:name, :address, :contact, :telephone, :product_ids=>[])
  end

  def buyer
    params.require(:buyer).permit(:name, :contact, :email, :certificate_type, :certificate_no, :is_caa_vip, :address, :zip, :phone, :mobile)
  end
end