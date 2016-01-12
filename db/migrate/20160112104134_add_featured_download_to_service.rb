class AddFeaturedDownloadToService < ActiveRecord::Migration
  def change
    add_column :services, :featured_download_id, :integer
    add_index :services, :featured_download_id
  end
end
