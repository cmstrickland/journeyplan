module JourneysHelper

  def maps_loader_script
"https://maps.googleapis.com/maps/api/js?callback=initMap&amp;key=#{ENV['GOOGLE_MAPS_API_KEY']}"

  end
end
