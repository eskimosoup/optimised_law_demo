class Service < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  has_closure_tree

  mount_uploader :image, ServiceUploader
  mount_uploader :leaflet, Optimadmin::DocumentUploader

  belongs_to :service_category
  has_one :department, through: :service_category
  has_many :service_testimonials, dependent: :destroy
  has_many :testimonials, -> { displayed }, through: :service_testimonials
  has_many :service_team_members, dependent: :destroy
  has_many :team_members, -> { displayed }, through: :service_team_members
  has_many :articles, -> { displayed }, dependent: :destroy
  has_many :service_offices, dependent: :destroy
  has_many :offices, -> { displayed }, through: :service_offices
  has_many :service_events, dependent: :destroy
  has_many :events, -> { displayed }, through: :service_events
  has_many :service_related_services, dependent: :destroy
  has_many :related_services, -> { displayed }, through: :service_related_services
  has_many :inverse_service_related_services, class_name: 'ServiceRelatedService', foreign_key: :related_service_id, dependent: :destroy
  has_many :inverse_related_services, through: :inverse_service_related_services, source: :service
  has_many :service_videos, dependent: :destroy
  has_many :videos, -> { displayed }, through: :service_videos
  has_many :service_downloads, dependent: :destroy
  has_many :downloads, -> { displayed }, through: :service_downloads
  has_many :service_case_studies, dependent: :destroy
  has_many :case_studies, -> { displayed }, through: :service_case_studies
  has_many :service_awards, dependent: :nullify
  has_many :awards, -> { displayed }, through: :service_awards

  validates :name, presence: true, uniqueness: { scope: :service_category_id }
  validates :suggested_url, uniqueness: true, allow_blank: true, case_sensitive: false

  scope :displayed, -> { joins(:service_category).where(display: true).merge(ServiceCategory.displayed) }

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
