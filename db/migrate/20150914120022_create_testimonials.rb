class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :author, null: true
      t.string :author_company, null: true
      t.text :recommendation, null: false
      t.integer :position, default: 0
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
