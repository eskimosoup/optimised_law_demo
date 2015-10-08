class CreateTourEntries < ActiveRecord::Migration
  def change
    create_table :tour_entries do |t|
      t.integer :position
      t.string :page, null: false
      t.string :page_area, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :joyride_options
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
