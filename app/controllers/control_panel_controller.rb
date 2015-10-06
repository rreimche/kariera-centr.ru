class ControlPanelController < ApplicationController

	http_basic_authenticate_with name: ENV['CP_USER'], password: ENV['CP_PASSWORD']

  def root
    cookies[:is_admin] = { value: "true", expires: 6.months.from_now} if cookies[:is_admin].nil?
  	@news = News.order(created_at: :desc).limit(5)
    @hot_offers = HotOffer.order(created_at: :desc).limit(5)
  	@courses = Course.where(start_date: (Time.now.midnight - 7.days)..(Time.now.midnight + 1.month)).order(:start_date)
  	@pages = StaticPage.order(updated_at: :desc, created_at: :desc).limit(5)
    @feedbacks = Feedback.order(updated_at: :desc, created_at: :desc).limit(5)
  end

  def list
  	@content_type = params.permit(:content_type)[:content_type]

  	redirect_to action: 'root' if @content_type.nil?

  	case @content_type
    	when 'news'
    		@data = News.order(created_at: :desc)
    		@edit_path = lambda{ |news| edit_news_path news }
    		@content = lambda{ |i| i.title }
      when 'hot_offers'
        @data = HotOffer.order(created_at: :desc)
        @edit_path = lambda{ |offer| edit_hot_offer_path offer }
        @content = lambda{ |i| i.content }
    	when 'courses'
    		@data = Course.order(start_date: :desc)
    		@edit_path = lambda{ |course| edit_course_path course }
    		@content = lambda{ |i| i.title }
    	when 'static_pages'
    		@data = StaticPage.order(updated_at: :desc)
    		@edit_path = lambda{ |page| edit_static_page_path page }
    		@content = lambda{ |i| i.title }
      when 'feedbacks'
        @data = Feedback.order(updated_at: :desc)
        @edit_path = lambda{ |feedback| edit_feedback_path feedback }
        @content = lambda{ |i| "#{i.name}: #{i.course.title}" }
    	else
  	end
  end

end
