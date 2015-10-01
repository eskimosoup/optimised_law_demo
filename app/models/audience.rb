class Audience < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, AudienceUploader

  has_many :departments, dependent: :destroy

  validates :name, :summary, :content, presence: true
  validates :suggested_url, uniqueness: true, allow_blank: true, case_sensitive: false

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }

  def self.layouts
    %w( basic )
  end

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
