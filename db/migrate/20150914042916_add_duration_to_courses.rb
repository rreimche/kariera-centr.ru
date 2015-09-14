class AddDurationToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :duration, :float
  end
end
