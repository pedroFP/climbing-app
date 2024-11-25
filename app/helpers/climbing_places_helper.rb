module ClimbingPlacesHelper
  def google_maps_url(latitude, longitude)
    "https://www.google.com/maps?q=#{latitude},#{longitude}"
  end
end
