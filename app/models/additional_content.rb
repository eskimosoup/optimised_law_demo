class AdditionalContent < ActiveRecord::Base
  validates :content, presence: true
  validates :area, presence: true, uniqueness: true

  scope :displayed, -> { where(display: true) }
  scope :area, -> (area) { displayed.find_by(area: area) }

  AREAS = ['Client Area', 'Tour Popup']
end
