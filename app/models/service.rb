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
  has_many :service_events, class_name: 'Service::Event', dependent: :destroy
  has_many :team_members, through: :service_events
  has_many :articles, dependent: :destroy
  has_many :service_offices, class_name: 'Service::Office', dependent: :destroy
  has_many :offices, through: :service_offices
  has_many :service_related_services, class_name: 'Service::RelatedService', dependent: :destroy
  has_many :related_services, through: :service_related_services
  has_many :inverse_service_related_services, class_name: 'Service::RelatedService', foreign_key: :related_service_id, dependent: :destroy
  has_many :inverse_related_services, through: :inverse_service_related_services, source: :service

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
