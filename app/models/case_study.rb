class CaseStudy < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  belongs_to :case_study_category

  has_many :service_case_studies, dependent: :destroy
  has_many :services, through: :service_case_studies

  validates :title, :summary, :content, :date, :case_study_category_id, presence: true
  validates :title, uniqueness: { scope: :case_study_category_id }
  validates :suggested_url, uniqueness: true, allow_blank: true, case_sensitive: false

  mount_uploader :image, CaseStudyUploader

  scope :displayed, -> { joins(:case_study_category).where("case_studies.display = ? AND date <= ?", true, Date.today).merge(CaseStudyCategory.displayed).order(:date) }

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end
end
