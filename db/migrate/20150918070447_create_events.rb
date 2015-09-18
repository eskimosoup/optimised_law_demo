class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :event_category, index: true, foreign_key: true
      t.belongs_to :event_location, index: true, foreign_key: true
      t.string :title
      t.text :summary
      t.string :image
      t.text :content
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.string :booking_link
      t.string :booking_information
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
