class HomepageControllerController < ApplicationController
  def show
  	#@news = News.order(created_at: :desc).limit(7)
  	#@courses_next = Course.where(start_date: (Time.now.midnight - 7.days)..(Time.now.midnight+1.month)).order(:start_date)
  	@num_courses = Course.count
  	@hot_offers = HotOffer.order(created_at: :desc).limit(7)

  	#select courses: 6 most recent or some most recent and some other
  	already_selected = []
  	@courses_next = Course.where(start_date: (Time.now.midnight - 7.days)..(Time.now.midnight+1.month)).order(:start_date).limit(6)
  	@courses_next.each { |course| already_selected.push course.id }
  	#select 6-@courses_next.count more courses which do have featured images
 	Course.where.not(id: already_selected, featured_image_file_name: nil).order("RANDOM()").limit(6-@courses_next.count).each {|course| @courses_next.push course}

=begin 
  	while @courses_next.count < 6
  		another_one = Course.all.order("RANDOM()").limit(1)
  		next if another_one.in? @courses_next

  		@courses_next.push another_one
  		#already_selected.push another_one
  	end
=end
  end
end
