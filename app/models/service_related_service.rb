class ServiceRelatedService < ActiveRecord::Base
  belongs_to :service
  belongs_to :related_service, class_name: "Service"
end
