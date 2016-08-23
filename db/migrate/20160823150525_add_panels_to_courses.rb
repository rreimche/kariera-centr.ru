class AddPanelsToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :panel0_title, :string, options: {limit: 255}
  	add_column :courses, :panel0_content, :text

  	add_column :courses, :panel1_title, :string, options: {limit: 255}
  	add_column :courses, :panel1_content, :text

  	add_column :courses, :panel2_title, :string, options: {limit: 255}
  	add_column :courses, :panel2_content, :text

  	add_column :courses, :panel3_title, :string, options: {limit: 255}
  	add_column :courses, :panel3_content, :text

  	add_column :courses, :panel4_title, :string, options: {limit: 255}
  	add_column :courses, :panel4_content, :text

  	add_column :courses, :panel5_title, :string, options: {limit: 255}
  	add_column :courses, :panel5_content, :text

  	add_column :courses, :panel6_title, :string, options: {limit: 255}
  	add_column :courses, :panel6_content, :text

  	add_column :courses, :panel7_title, :string, options: {limit: 255}
  	add_column :courses, :panel7_content, :text
  end
end
