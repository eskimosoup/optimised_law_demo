class AddHomePageHighlightToDownload < ActiveRecord::Migration
  def change
    add_reference :downloads, :download_category, index: true, foreign_key: true
  end
end
