class ArticleCategory < ActiveRecord::Base

  has_many :articles, dependent: :nullify
  validates :name, presence: true, uniqueness: true

  scope :displayed, -> { where(display: true) }
end
