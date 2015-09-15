class CreateTeamMemberTestimonials < ActiveRecord::Migration
  def change
    create_table :team_member_testimonials do |t|
      t.belongs_to :team_member, index: true, foreign_key: true
      t.belongs_to :testimonial, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
