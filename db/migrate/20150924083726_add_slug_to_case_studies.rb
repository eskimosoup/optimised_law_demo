class AddSlugToCaseStudies < ActiveRecord::Migration
  def change
    add_column :case_study_categories, :slug, :string, unique: true
  end
end
