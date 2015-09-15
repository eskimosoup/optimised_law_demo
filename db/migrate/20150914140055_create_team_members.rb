class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :forename, null: false
      t.string :surname, null: false
      t.string :image
      t.belongs_to :team_member_role, index: true, foreign_key: true
      t.string :email
      t.string :primary_phone_number
      t.string :secondary_phone_number
      t.string :mobile_phone_number
      t.string :google_plus
      t.string :twitter
      t.string :linkedin
      t.text :biography
      t.string :suggested_url
      t.string :slug
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
