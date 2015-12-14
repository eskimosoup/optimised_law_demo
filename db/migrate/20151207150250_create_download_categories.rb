class CreateDownloadCategories < ActiveRecord::Migration
  def change
    create_table :download_categories do |t|
      t.string :name, null: false, unique: true
      t.boolean :display, default: true
      t.boolean :homepage_highlight

      t.timestamps null: false
    end
  end
end
