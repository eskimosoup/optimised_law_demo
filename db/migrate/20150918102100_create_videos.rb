class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name, null: false
      t.text :youtube_embed_code, null: false
      t.boolean :display, default: true
      t.belongs_to :video_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
