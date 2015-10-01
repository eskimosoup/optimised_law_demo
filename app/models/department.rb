class Department < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, DepartmentUploader
  mount_uploader :leaflet, Optimadmin::DocumentUploader

  belongs_to :audience
  has_many :services, dependent: :destroy

  validates :audience, presence: true
  validates :name, presence: true

  scope :displayed, -> { where(display: true) }

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
