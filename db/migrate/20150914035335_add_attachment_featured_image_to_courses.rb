class AddAttachmentFeaturedImageToCourses < ActiveRecord::Migration
  def self.up
    change_table :courses do |t|
      t.attachment :featured_image
    end
  end

  def self.down
    remove_attachment :courses, :featured_image
  end
end
