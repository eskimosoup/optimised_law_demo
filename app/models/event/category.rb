class Event::Category < ActiveRecord::Base
  has_many :events, dependent: :nullify, foreign_key: :event_category_id
  validates :name, presence: true, uniqueness: true
end
