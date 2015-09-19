class AddEmploymentToFeedbacks < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :is_for_hr_services, :boolean
  end
end
