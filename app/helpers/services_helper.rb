module ServicesHelper
	def get_products
		Product.by_car_models(@service.car.car_model_id)
	end
end
