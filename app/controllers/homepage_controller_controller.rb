class HomepageControllerController < ApplicationController
  def show
  	@news = News.order(created_at: :desc).limit(7)
  	@courses_next = Course.where(start_date: (Time.now.midnight - 7.days)..(Time.now.midnight+1.month)).order(:start_date)
  end
end
