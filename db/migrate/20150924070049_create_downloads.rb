class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.string :summary, null: false
      t.string :file, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
