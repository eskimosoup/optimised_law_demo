class Testimonial < ActiveRecord::Base

  has_many :service_testimonials, class_name: 'Service::Testimonial', dependent: :destroy
  has_many :services, through: :service_testimonials

  validates :recommendation, presence: true
end
