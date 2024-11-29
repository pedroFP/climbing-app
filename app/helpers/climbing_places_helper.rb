module ClimbingPlacesHelper
  def google_maps_url(latitude, longitude)
    "https://www.google.com/maps?q=#{latitude},#{longitude}"
  end

  def countries_names_for_select
    ISO3166::Country.all.map { |c| [ c.iso_short_name, c.iso_short_name ] }
  end
end
