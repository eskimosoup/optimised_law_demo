class AddDisplayToEventLocation < ActiveRecord::Migration
  def change
    add_column :event_locations, :display, :boolean, default: true
  end
end
