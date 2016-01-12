class Service < ActiveRecord::Base
  include NullifyBlanks
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  has_closure_tree

  mount_uploader :image, ServiceUploader
  mount_uploader :leaflet, Optimadmin::DocumentUploader

  belongs_to :department
  belongs_to :featured_download, class_name: 'Download', foreign_key: :featured_download_id
  has_one :audience, through: :department
  has_many :service_testimonials, dependent: :destroy
  has_many :testimonials, -> { displayed }, through: :service_testimonials
  has_many :service_team_members, dependent: :destroy
  has_many :team_members, -> { displayed }, through: :service_team_members
  has_many :service_articles, dependent: :destroy
  has_many :articles, -> { displayed }, through: :service_articles
  has_many :service_offices, dependent: :destroy
  has_many :offices, -> { displayed }, through: :service_offices
  has_many :service_events, dependent: :destroy
  has_many :events, -> { displayed }, through: :service_events
  has_many :service_related_services, dependent: :destroy
  has_many :related_services, through: :service_related_services
  has_many :displayed_related_services, -> { displayed }, through: :service_related_services
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
  has_many :service_faqs, dependent: :destroy
  has_many :frequently_asked_questions, -> { displayed }, through: :service_faqs
  has_many :pages, dependent: :nullify

  LAYOUTS = %w{ resource_focused widget_focused news_focused }

  validates :name, presence: true, uniqueness: { scope: :department_id }
  validates :department_id, presence: true
  validates :suggested_url, uniqueness: true, allow_blank: true, case_sensitive: false
  validates :layout, inclusion: LAYOUTS, allow_blank: true

  scope :displayed, -> { joins(:department).where(display: true).merge(Department.displayed) }

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
