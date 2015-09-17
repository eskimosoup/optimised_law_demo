class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :position
      t.string :name
      t.string :link
      t.string :image
      t.string :award_type
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
