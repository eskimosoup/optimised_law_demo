class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :image
      t.text :summary
      t.text :content
      t.string :layout
      t.string :slug
      t.string :suggested_url
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
