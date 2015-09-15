class Service < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  has_closure_tree

  mount_uploader :image, ServiceUploader

  belongs_to :service_category
  has_one :department, through: :service_category
  has_many :service_testimonials, class_name: 'Service::Testimonial', dependent: :destroy
  has_many :testimonials, through: :service_testimonials
  has_many :service_team_members, class_name: 'Service::TeamMember', dependent: :destroy
  has_many :team_members, through: :service_team_members
  has_many :articles, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :service_category_id }

  scope :displayable, -> { where(display: true) }

  def slug_candidates
    [
      :suggested_url,
      :name,
      [:suggested_url, :name]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || name_changed?
  end
end
