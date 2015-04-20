class HomepageControllerController < ApplicationController
  def show
  	@news = News.order(created_at: :desc).limit(5)
  	@courses_next = Course.order(start_date: :desc).limit(5)
  end
end
