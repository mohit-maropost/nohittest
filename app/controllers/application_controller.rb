class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  before_action :configure_permitted_parameters, if: :devise_controller?
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :check_url, only: [:new], if: :devise_controller?

  # def create
  #   super
  # end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :account_name])
  end

  def check_url
  	debugger
  	if params[:invite_token] != nil
	    org =  Invite.where(token: params[:invite_token]).first #find the user group attached to the invite
		redirect_to(invites_check_url_path) if org
	end
  end
end
