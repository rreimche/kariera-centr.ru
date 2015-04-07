class CreateStaticPages < ActiveRecord::Migration
  def change
    create_table :static_pages do |t|
      t.string :title
      t.text :content
      t.datetime :published

      t.timestamps
    end
  end
end
