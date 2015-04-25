class AddPhoneToSignups < ActiveRecord::Migration
  def change
    add_column :signups, :phone, :string
  end
end
