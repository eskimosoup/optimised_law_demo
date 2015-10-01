class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.belongs_to :audience, index: true, foreign_key: true
      t.string :name, null: false
      t.text :summary
      t.string :image
      t.string :slug, index: true
      t.string :suggested_url
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
