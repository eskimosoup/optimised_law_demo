class ServiceCategory < ActiveRecord::Base
  belongs_to :department

  mount_uploader :image, ServiceCategoryUploader

  validates :department, presence: true
  validates :name, presence: true
end
