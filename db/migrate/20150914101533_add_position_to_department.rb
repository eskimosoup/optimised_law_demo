class AddPositionToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :position, :integer
  end
end
