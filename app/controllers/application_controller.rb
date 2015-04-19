class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout Proc.new{
  	if controller_name == "control_panel" or ['edit', 'new'].include?(action_name)
  		'edit'
  	else
  		'application'
  	end
  }
end
