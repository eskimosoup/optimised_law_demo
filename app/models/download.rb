class Download < ActiveRecord::Base
  mount_uploader :image, DownloadUploader
  mount_uploader :file, Optimadmin::DocumentUploader

  has_many :service_downloads, dependent: :destroy
  has_many :services, through: :service_downloads

  validates :title, :summary, :image, :file, :service_ids, presence: true

  scope :displayed, -> { where(display: true) }
end
