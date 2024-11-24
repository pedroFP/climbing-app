class ClimbingPlace < ApplicationRecord
  VALID_URL_REGEX = /\A(http|https):\/\/[^\s]+\z/i

  has_rich_text :description

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
  private
    def set_country
      result = Geocoder.search([latitude, longitude]).first
      self.country = result.country if result
    end
end
