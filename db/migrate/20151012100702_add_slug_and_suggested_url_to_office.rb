class AddSlugAndSuggestedUrlToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :slug, :string
    add_column :offices, :suggested_url, :string
  end
end
