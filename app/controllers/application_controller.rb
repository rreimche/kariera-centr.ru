class ApplicationController < ActionController::Base
  #  http_basic_authenticate_with name: ENV['CP_USER'], password: ENV['CP_PASSWORD']

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :prepare_sidebar
  layout Proc.new{
  	if controller_name == "control_panel" or ['edit', 'new', 'create', 'update'].include?(action_name)
  		'edit'
  	else
  		'application'
  	end
  } 

  def prepare_sidebar
    @news = News.order(created_at: :desc).limit(7)
    @courses_next = Course.where(start_date: (Time.now.midnight - 7.days)..(Time.now.midnight+1.month)).order(:start_date)
  end
end
