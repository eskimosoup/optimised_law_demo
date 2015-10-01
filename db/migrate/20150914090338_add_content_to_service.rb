class AddContentToService < ActiveRecord::Migration
  def change
    add_column :services, :content, :text
    add_column :departments, :sub_heading, :text
  end
end
