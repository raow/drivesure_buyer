class ServicesController < ApplicationController
	load_and_authorize_resource :except => [:get_product, :get_price, :get_cars]
	protect_from_forgery :except => [:get_product, :get_price]
	
	def index
		@services = @services.joins(:dealer,:product,:car=>:car_model).includes(:product,:dealer,:car=>:car_model).search(params[:search]).by_car_models(params[:car_model]).page(params[:page])
	end

	def new
		@service.build_car.build_driver
		@service.build_buyer
	end


	def create

		@service = Service.new(permitted_params.service)
		@service.user_id = current_user.id
		@service.dealer_id = current_user.dealer_id
		@service.dealer_id = current_user.dealer_id
		@service.is_delete = false
		
		respond_to do |format|
	      if @service.save
	      	format.html {  redirect_to services_path } 
	      else
	        format.html { render action: 'new' }
	        format.json { render json: @service.errors, status: :unprocessable_entity }
	      end
	    end
	end

	def show
	end

	def print
		render layout: false
	end

	def destroy
		@service.is_delete = true
		@service.save

		respond_to do |format|
		  format.html { redirect_to services_url }
		end
	end

	def get_product
		pro_list = Product.by_car_models(params[:id])
		p pro_list
		respond_to do |format|
		  format.html { render json: pro_list.to_json }
		  format.json { render json: pro_list.to_json }
		end
	end

	def get_price
		pro = Product.find(params[:id])
		p pro
		respond_to do |format|
		  format.html { render json: pro.to_json }
		  format.json { render json: pro.to_json }
		end
	end

  	def get_cars
      cars = Car.filter(params[:column_name],params[:q],params[:page_limit]).to_a
 

      # nil_object = Car.new
      # nil_object[params[:column_name]] = params[:q]
      # cars.insert(0,nil_object)
     	
      p cars.to_json(:include => :driver)

      respond_to do |format|
          format.html 
          format.json { render json: cars.to_json(:include => :driver) }
      end
  	end
	
  	def get_buyers
      buyers = Buyer.filter(params[:column_name],params[:q],params[:page_limit]).to_a
     	
      p buyers.to_json()

      respond_to do |format|
          format.html 
          format.json { render json: buyers.to_json() }
      end
  	end
end
