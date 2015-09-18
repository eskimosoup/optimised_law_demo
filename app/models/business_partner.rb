class BusinessPartner < ActiveRecord::Base
  mount_uploader :image, BusinessPartnerUploader

  scope :positioned, -> { order :position }
  scope :displayed, -> { where display: true }

  validates :name, :image, presence: true

  before_save :smart_add_url_protocol, if: Proc.new{|f| f.link.present? }

  private

    def smart_add_url_protocol
      # http://stackoverflow.com/a/7908693
      self.link = "http://#{self.link}" unless self.link[/\Ahttp:\/\//] || self.link[/\Ahttps:\/\//]
    end
end
