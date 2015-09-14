class Article::Category < ActiveRecord::Base

  has_many :articles, dependent: :nullify, foreign_key: :article_category_id
  validates :name, presence: true, uniqueness: true

end
