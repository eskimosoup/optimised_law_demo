class AddServiceToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :service_id, :integer
    add_index :articles, :service_id
  end
end
