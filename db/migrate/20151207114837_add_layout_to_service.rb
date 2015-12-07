class AddLayoutToService < ActiveRecord::Migration
  def change
    add_column :services, :layout, :string, null: true
  end
end
