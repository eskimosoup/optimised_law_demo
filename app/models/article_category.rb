class ArticleCategory < ActiveRecord::Base

  has_many :articles, dependent: :nullify
  validates :name, presence: true, uniqueness: true

end
