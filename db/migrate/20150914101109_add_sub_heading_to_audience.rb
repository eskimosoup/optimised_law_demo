class AddSubHeadingToAudience < ActiveRecord::Migration
  def change
    add_column :audiences, :sub_heading, :string
  end
end
