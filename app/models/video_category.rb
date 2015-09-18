class VideoCategory < ActiveRecord::Base
  has_many :videos, dependent: :destroy

  validates :name, presence: true

end
