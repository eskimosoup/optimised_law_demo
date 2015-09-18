class Testimonial < ActiveRecord::Base

  has_many :service_testimonials, dependent: :destroy
  has_many :services, through: :service_testimonials
  has_many :team_member_testimonials, dependent: :destroy
  has_many :team_members, through: :team_member_testimonials

  scope :positioned, -> { order :position }
  scope :displayable, -> { where display: true }

  validates :recommendation, presence: true
end
