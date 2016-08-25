class AddCurriculumsToCourses < ActiveRecord::Migration
  def change
  	(0...ENV['COURSE_CURRICULUMPARTS_QTY'].to_i).each do |i|
  		add_column :courses, "curriculum#{i}_title", :string, options: {limit: 255}
  		add_column :courses, "curriculum#{i}_content", :text
  	end
  end
end

