class ChangeCourseTypeInSignups < ActiveRecord::Migration
  def change
  		change_column :signups, :course, :integer
  end
end
