class Testimonial < ActiveRecord::Base

  has_many :service_testimonials, dependent: :destroy
  has_many :services, through: :service_testimonials
  has_many :team_member_testimonials, dependent: :destroy
  has_many :team_members, through: :team_member_testimonials

  validates :recommendation, presence: true
end
