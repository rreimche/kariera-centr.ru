class ControlPanelController < ApplicationController

	http_basic_authenticate_with name: ENV['CP_USER'], password: ENV['CP_PASSWORD']

  def root
  	@news = News.order(:created_at).limit(5).reverse
  	@courses = Course.order(:updated_at).limit(5).reverse
  	@pages = StaticPage.order(:updated_at).limit(5).reverse
  end

  def list
  	@content_type = params.permit(:content_type)[:content_type]

  	redirect_to action: 'root' if @content_type.nil?

  	case @content_type
  	when 'news'
  		@data = News.order(:created_at).reverse
  		@edit_path = lambda{ |news| edit_news_path news }
  		@content = lambda{ |i| i.content }
  	when 'courses'
  		@data = Course.order(:updated_at).reverse
  		@edit_path = lambda{ |course| edit_course_path course }
  		@content = lambda{ |i| i.title }
  	when 'static_pages'
  		@data = StaticPage.order(:updated_at).reverse
  		@edit_path = lambda{ |page| edit_static_page_path course }
  		@content = lambda{ |i| i.title }
  	else
  	end
  end

end
