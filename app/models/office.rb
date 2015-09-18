class Office < ActiveRecord::Base

  mount_uploader :image, OfficeUploader

  belongs_to :office_location
  has_many :service_offices, dependent: :destroy
  has_many :services, through: :service_offices

  delegate :name, to: :office_location, prefix: true

  validates :name, presence: true, uniqueness: { scope: :office_location_id }
  validates :postcode, presence: true
  validates :office_location, presence: true
end
