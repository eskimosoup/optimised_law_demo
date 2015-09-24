class ServiceCaseStudy < ActiveRecord::Base
  belongs_to :service
  belongs_to :case_study
end
