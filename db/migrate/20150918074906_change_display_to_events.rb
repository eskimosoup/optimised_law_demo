class ChangeDisplayToEvents < ActiveRecord::Migration
  def change
    remove_column :event_categories, :display, :boolean
    add_column :event_categories, :display, :boolean, default: true
  end
end
