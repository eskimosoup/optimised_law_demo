class ServiceAward < ActiveRecord::Base
  belongs_to :award
  belongs_to :service
end
