class ClimbingPlace < ApplicationRecord
  VALID_URL_REGEX = /\A(http|https):\/\/[^\s]+\z/i

  belongs_to :user

  has_rich_text :description

  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 100, 100 ]
  end

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  validates :address, presence: true

  validates :link,
    format: { with: VALID_URL_REGEX, message: "must be a valid URL starting with http or https" },
    if: ->(obj) { obj.link.present? && obj.link_changed? }

  after_validation :geocode, if: ->(obj) { obj.address.present? && obj.address_changed? }
  after_validation :reverse_geocode
  after_validation :set_country,
                   if: ->(obj) { obj.latitude.present? && obj.longitude.present? }

  scope :search_by_country, ->(country) { where(country: country.titleize) }
  private
    def set_country
      result = Geocoder.search([ latitude, longitude ]).first
      self.country = result.country if result
    end
end
