class TeamMemberRole < ActiveRecord::Base

  has_many :team_members, dependent: :nullify, foreign_key: :team_member_role_id
  validates :name, presence: true, uniqueness: true

  scope :displayed, -> { where(display: true) }
end
