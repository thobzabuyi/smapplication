class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
	rescue_from "AccessGranted::AccessDenied" do |exception|
	log_out
    redirect_to root_path
    flash[:danger] = "You don't have permission to access this page."
  end
end
