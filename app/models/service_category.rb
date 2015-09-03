class ServiceCategory < ActiveRecord::Base
  belongs_to :department

  validates :department, presence: true
  validates :name, presence: true
end
