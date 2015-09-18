class AddSlugToEvent < ActiveRecord::Migration
  def change
    add_column :events, :slug, :string, unique: true
    add_column :events, :suggested_url, :string, unique: true
  end
end
