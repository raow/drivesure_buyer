class UsersController < ApplicationController
	load_and_authorize_resource
	
	def index
		@users = @users.page(params[:page])
	end

	def new 
	end

	def create
		p 'assass'
		@user = User.new(permitted_params.user)
		@user.save
		redirect_to users_url
	end


end
