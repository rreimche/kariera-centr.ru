class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.text :content
      t.references :course, index: true

      t.timestamps
    end
  end
end
