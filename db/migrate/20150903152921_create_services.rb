class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :department, index: true, foreign_key: true
      t.integer :parent_id
      t.string :name, null: false
      t.string :image
      t.string :summary
      t.string :slug, index: true
      t.string :suggested_url
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
