class AddLeafletToServiceAndServiceCategory < ActiveRecord::Migration
  def change
    add_column :services, :leaflet, :string
    add_column :service_categories, :leaflet, :string
  end
end
