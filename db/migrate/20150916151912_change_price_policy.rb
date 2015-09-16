class ChangePricePolicy < ActiveRecord::Migration
  def change
  	add_column :courses, :advance_payment, :integer
  	add_column :courses, :monthly_payment, :integer
  end
end
