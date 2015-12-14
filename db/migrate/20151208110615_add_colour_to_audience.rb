class AddColourToAudience < ActiveRecord::Migration
  def change
    add_column :audiences, :colour, :string
  end
end
