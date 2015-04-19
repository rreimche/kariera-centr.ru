class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :short_descr
      t.text :full_descr
      t.date :start_date
      t.decimal :full_price
      t.integer :timegroup

      t.timestamps
    end
  end
end
