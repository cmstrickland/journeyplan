class CityMapperRequest

  REQUEST_DOMAIN = 'developer.citymapper.com'
  API_RESOURCE = 'api/1/traveltime'
  def initialize(start: nil,finish: nil,time: nil)
    @start = start
    @finish = finish
    @time = time
  end

  def uri
    params = {
               "key" => api_key,
               "time_type" => 'arrival',
               "time" => @time,
               "startcoord" => @start.to_s,
               "endcoord" => @finish.to_s
             }
    uri_str = "https://#{REQUEST_DOMAIN}/#{API_RESOURCE}/?#{params.to_param}"
    URI.parse(uri_str)
  end

  def api_key
    ENV['CITYMAPPER_API_KEY']
  end

end
