class Video < ActiveRecord::Base

  belongs_to :video_category
  has_many :service_videos, dependent: :destroy
  has_many :services, through: :service_videos

  delegate :name, to: :video_category, prefix: true

  validates :name, presence: true, uniqueness: true
  validates :youtube_embed_code, :video_category, presence: true
  after_validation :set_video_embed_width_and_height

  mount_uploader :image, VideoUploader

  scope :displayed, -> { joins(:video_category).where(display: true).merge(VideoCategory.displayed) }

  def set_video_embed_width_and_height
    self.youtube_embed_code.gsub!(/width="\d*"/, 'width="600"').gsub!(/height="\d*"/, 'height="300"') unless youtube_embed_code.blank?
  end
end
