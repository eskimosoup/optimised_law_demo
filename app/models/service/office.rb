class Service::Office < ActiveRecord::Base
  belongs_to :service
  belongs_to :office
end
