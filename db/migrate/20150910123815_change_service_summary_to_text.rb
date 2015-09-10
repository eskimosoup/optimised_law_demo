class ChangeServiceSummaryToText < ActiveRecord::Migration
  def change
    change_column :services, :summary, :text
  end
end
