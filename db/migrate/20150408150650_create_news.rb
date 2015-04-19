class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :content
      t.datetime :published

      t.timestamps
    end
  end
end
