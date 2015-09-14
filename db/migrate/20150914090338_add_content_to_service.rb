class AddContentToService < ActiveRecord::Migration
  def change
    add_column :services, :content, :text
    add_column :service_categories, :sub_heading, :text
  end
end
