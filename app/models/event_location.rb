class EventLocation < ActiveRecord::Base
  has_many :events, foreign_key: :event_location_id, dependent: :nullify

  validates :name, :address_line_1, :town, :postcode, presence: true
  validates :name, uniqueness: true
end
