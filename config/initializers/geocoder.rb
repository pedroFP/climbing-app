Geocoder.configure(
  # Geocoding options
  lookup: :google, # Use Google for geocoding
  api_key: Rails.application.credentials[:google_api_key], # Secure your API key in an environment variable
  timeout: 5, # Set request timeout
  units: :km, # :km for kilometers, :mi for miles
  use_https: true, # Use HTTPS for requests
  cache: Rails.cache, # Optional: cache responses to improve performance
  cache_prefix: "geocoder:"
)
