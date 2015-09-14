class ChangeContentByHotOffersToText < ActiveRecord::Migration
  def change
  	change_column :hot_offers, :content, :text
  end
end
