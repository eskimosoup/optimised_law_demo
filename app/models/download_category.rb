class DownloadCategory < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :homepage_highlight, uniqueness: { message: 'has already been set' }

  has_many :downloads, dependent: :nullify

  scope :displayed, -> { where(display: true) }
  scope :homepage_highlight, -> { displayed.find_by(homepage_highlight: true) }
end
