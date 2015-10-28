class AddHomePageHighlight < ActiveRecord::Migration
  def change
    add_column :articles, :home_page_highlight, :boolean, default: true
  end
end
