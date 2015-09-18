class VideoCategory < ActiveRecord::Base
  has_many :videos, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  scope :displayed, -> {where(display: true) }
end
