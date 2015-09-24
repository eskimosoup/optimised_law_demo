class AddDisplayinFooterToAccreditations < ActiveRecord::Migration
  def change
    add_column :awards, :in_footer, :boolean, default: false
  end
end
