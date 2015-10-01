class Article < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  belongs_to :article_category
  belongs_to :team_member
  belongs_to :service
  mount_uploader :image, ArticleUploader

  validates :title, :content, :date, :article_category_id, presence: true
  validates :suggested_url, uniqueness: true, allow_blank: true, case_sensitive: false

  scope :displayed, -> { joins(:article_category).where("articles.display = ? AND date <= ?", true, Date.today).merge(ArticleCategory.displayed) }
  scope :for_category, ->(category) { joins(:article_categories).where(article_category_id: category) if category.present? }

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
