class AddPeopleHelpedWidgetToService < ActiveRecord::Migration
  def change
    add_column :services, :has_people_helped_widget, :boolean, default: true
  end
end
