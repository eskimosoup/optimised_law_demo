class CreateCaseStudies < ActiveRecord::Migration
  def change
    create_table :case_studies do |t|
      t.string :title, null: false
      t.text :summary, null: false
      t.string :image
      t.text :content, null: false
      t.date :date, null: false
      t.string :slug
      t.string :suggested_url
      t.boolean :display, default: true
      t.belongs_to :case_study_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
