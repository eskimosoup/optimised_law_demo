class Department < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, DepartmentUploader

  has_many :service_categories, dependent: :destroy

  validates :name, :summary, :content, presence: true

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
