class CreateBusinessPartners < ActiveRecord::Migration
  def change
    create_table :business_partners do |t|
      t.integer :position
      t.string :name
      t.string :link
      t.string :image
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
