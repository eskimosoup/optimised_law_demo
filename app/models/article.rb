class Article < ActiveRecord::Base
  belongs_to :article_category, class_name: "Article::Category"
  mount_uploader :image, ArticleUploader

  validates :title, :content, :date, presence: true
end
