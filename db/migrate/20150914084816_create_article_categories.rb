class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :name, null: false
      t.string :slug, null: true
      t.string :suggested_url, null: true
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
