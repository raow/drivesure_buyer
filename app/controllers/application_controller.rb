class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_filter :set_current_user
  
  def layout_by_resource
    if devise_controller?
        'sign_layout'
    else
        case action_name 
        when 'index' then 'application_table'
        else 'application_form' 
        end
    end
	     
  end

  def after_sign_in_path_for(resource)
      "/services" # <- Path you want to redirect the user to.
  end

  def after_sign_out_path_for(resource)
      "/users/sign_in" # <- Path you want to redirect the user to.
  end
  
  before_action do
	  resource = controller_name.singularize
	  method = "permitted_params"
	  params[resource.to_sym] &&= send(method).send(resource) if respond_to?(method, true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    #current_aility.sign_out
    p exception.message
    redirect_to new_user_session_url
  end



  def set_current_user
    User.current_user = current_user
  end

  def user_for_paper_trail
    current_user if user_signed_in?
  end
  
private
  def permitted_params
    @permitted_params ||= PermittedParams.new(params)
  end
  
end
