class Article < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  belongs_to :article_category, class_name: "Article::Category"
  belongs_to :team_member
  belongs_to :service
  mount_uploader :image, ArticleUploader

  validates :title, :content, :date, presence: true

  scope :displayable, -> { where("display = ? AND date <= ?", true, Date.today) }

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
