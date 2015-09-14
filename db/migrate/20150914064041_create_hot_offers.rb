class CreateHotOffers < ActiveRecord::Migration
  def change
    create_table :hot_offers do |t|
      t.string :content
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
