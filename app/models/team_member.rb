class TeamMember < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]
  mount_uploader :image, TeamMemberUploader

  belongs_to :team_member_role
  has_many :team_member_testimonials, dependent: :destroy
  has_many :testimonials, through: :team_member_testimonials
  has_many :articles, dependent: :nullify
  has_many :service_team_members, dependent: :destroy
  has_many :services, through: :service_team_members
  has_many :event_team_members, class_name: "Event::TeamMember", dependent: :destroy
  has_many :events, through: :event_team_members

  delegate :name, to: :team_member_role, prefix: true, allow_nil: true

  validates :forename, :surname, presence: true
  validates :email, uniqueness: true


  def slug_candidates
    [
      :suggested_url,
      [:forename, :surname],
      [:suggested_url, :forename, :surname]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || forename_changed? || surname_changed?
  end
end
