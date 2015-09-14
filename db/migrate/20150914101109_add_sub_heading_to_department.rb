class AddSubHeadingToDepartment < ActiveRecord::Migration
  def change
    add_column :departments, :sub_heading, :string
  end
end
