class CreateEventLocations < ActiveRecord::Migration
  def change
    create_table :event_locations do |t|
      t.string :name
      t.string :address_line_1
      t.string :address_line_2
      t.string :town
      t.string :region
      t.string :postcode
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
