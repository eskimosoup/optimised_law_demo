class Award < ActiveRecord::Base
  mount_uploader :image, AwardUploader

  scope :positioned, -> { order :position }
  scope :displayed, -> { where(display: true).positioned }
  scope :in_footer, -> { where(in_footer: true).displayed.positioned }

  AWARD_TYPES = %w{ award accreditation }

  validates :name, :image, presence: true
  validates :award_type, presence: true, inclusion: { in: AWARD_TYPES }

  before_save :smart_add_url_protocol, if: Proc.new{|f| f.link.present? }

  has_many :service_awards, dependent: :nullify
  has_many :services, through: :service_awards

  private

    def smart_add_url_protocol
      # http://stackoverflow.com/a/7908693
      self.link = "http://#{self.link}" unless (self.link[/\Ahttp:\/\//] || self.link[/\Ahttps:\/\//])
    end
end
