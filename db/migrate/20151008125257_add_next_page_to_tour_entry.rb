class AddNextPageToTourEntry < ActiveRecord::Migration
  def change
    add_column :tour_entries, :next_page, :string
  end
end
