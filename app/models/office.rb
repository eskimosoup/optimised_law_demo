class Office < ActiveRecord::Base

  mount_uploader :image, OfficeUploader

  belongs_to :office_location, class_name: "Office::Location"

  delegate :name, to: :office_location, prefix: true

  validates :name, presence: true, uniqueness: { scope: :office_location_id }
  validates :postcode, presence: true
  validates :office_location, presence: true
end
