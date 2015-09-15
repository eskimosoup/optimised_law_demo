class Testimonial < ActiveRecord::Base

  has_many :service_testimonials, class_name: 'Service::Testimonial', dependent: :destroy
  has_many :services, through: :service_testimonials
  has_many :team_member_testimonials, class_name: 'TeamMember::Testimonial', dependent: :destroy
  has_many :team_members, through: :team_member_testimonials

  validates :recommendation, presence: true
end
