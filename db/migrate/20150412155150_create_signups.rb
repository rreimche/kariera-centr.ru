class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :course
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
