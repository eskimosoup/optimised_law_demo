class CreateEventTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_member_events do |t|
      t.belongs_to :event, index: true, foreign_key: true
      t.belongs_to :team_member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
