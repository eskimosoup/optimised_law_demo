class CreateServiceCategories < ActiveRecord::Migration
  def change
    create_table :service_categories do |t|
      t.belongs_to :department, index: true, foreign_key: true
      t.string :name, null: false
      t.text :summary
      t.string :image
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
