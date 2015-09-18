class Article < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  belongs_to :article_category
  belongs_to :team_member
  belongs_to :service
  mount_uploader :image, ArticleUploader

  validates :title, :content, :date, :article_category_id, presence: true

  scope :displayed, -> { joins(:article_category).where("articles.display = ? AND date <= ?", true, Date.today).merge(ArticleCategory.displayed) }

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
