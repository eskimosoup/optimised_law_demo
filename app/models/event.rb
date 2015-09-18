class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  belongs_to :event_category
  belongs_to :event_location
  has_many :team_member_events, dependent: :nullify
  has_many :team_members, through: :team_member_events
  has_many :service_events, dependent: :destroy
  has_many :services, through: :service_events

  mount_uploader :image, EventUploader

  validates :title, :summary, :content, :start_date_time, :end_date_time, presence: true
  validates :suggested_url, uniqueness: true, allow_blank: true
  validate :sensible_dates

  scope :displayed, -> { joins(:event_location, :event_category).where("start_date_time >= ?", DateTime.now).merge(EventLocation.displayed).merge(EventCategory.displayed) }

  def sensible_dates
    errors.add(:end_date_time, 'cannot be before the start date time') if self.start_date_time.present? && self.end_date_time.present? && (self.end_date_time < self.start_date_time)
  end

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end
end
