class ChangeServiceIdToDepartmentId < ActiveRecord::Migration
  def change
    #rename_table :departments, :audiences
    #rename_table :service_categories, :departments
    #rename_column :services, :service_category_id, :department_id
    rename_column :departments, :department_id, :audience_id
  end
end
