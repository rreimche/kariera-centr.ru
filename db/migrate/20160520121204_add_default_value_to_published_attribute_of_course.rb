class AddDefaultValueToPublishedAttributeOfCourse < ActiveRecord::Migration
  def up
    change_column :courses, :published, :boolean, :default => true
  end

  def down
    change_column :courses, :published, :boolean, :default => nil
  end
end
