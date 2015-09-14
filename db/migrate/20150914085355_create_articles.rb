class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :article_category, index: true, foreign_key: true
      t.string :title, null: false
      t.text :summary, null: true
      t.string :image, null: true
      t.text :content, null: false
      t.date :date, null: false
      t.string :slug, null: true
      t.string :suggested_url, null: true
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
