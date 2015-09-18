class OfficeLocation < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  has_many :offices, dependent: :destroy

  validates :name, presence: true, uniqueness: true

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
