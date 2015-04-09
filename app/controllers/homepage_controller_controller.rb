class HomepageControllerController < ApplicationController
  def show
  	@news = News.order(:created_at).limit(5).reverse
  	@courses_next = Course.order(:created_at).limit(5).reverse
  end
end
