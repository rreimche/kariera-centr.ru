class AddSubtitleToStaticPages < ActiveRecord::Migration
  def change
  	add_column :static_pages, :subtitle, :string
  end
end
