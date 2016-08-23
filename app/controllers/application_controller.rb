
class ApplicationController < ActionController::Base

  #require "#{Rails.root}/lib/tabbedpresenter.rb"
  #require "#{Rails.root}/lib/tabpresenter.rb" 
  #  http_basic_authenticate_with name: ENV['CP_USER'], password: ENV['CP_PASSWORD']

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :prepare_sidebar
  layout Proc.new{
  	if controller_name == "control_panel" or 
      ( action_name.in?(['edit', 'new', 'create', 'update']) and controller_name != 'feedbacks' ) or 
      ( action_name.in?(['edit', 'update']) and controller_name == 'feedbacks' )
  		
      'edit'
  	else
      
  		'application'
  	end
  } 

  #Shortcode.register_presenter(TabbedPresenter, TabPresenter)

  Shortcode.setup do |config|
    config.block_tags = [:collapse, :accordion] #, :tabbed, :tab, :pilled, :pill]
    #config.self_closing_tags = [:gallery, :widget]
    config.attribute_quote_type = '&quot;'
  end

  def prepare_sidebar 
    @newslist = News.order(created_at: :desc).limit(7)
    @hot_offers = HotOffer.order(created_at: :desc).limit(7)
    @courses_next = Course.where(start_date: (Time.now.midnight - 7.days)..(Time.now.midnight+1.month), published: true).order(:start_date)
  end
end
