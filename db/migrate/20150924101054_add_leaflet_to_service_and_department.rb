class AddLeafletToServiceAndDepartment < ActiveRecord::Migration
  def change
    add_column :services, :leaflet, :string
    add_column :departments, :leaflet, :string
  end
end
