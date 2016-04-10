class Visit < ActiveRecord::Base
  validates :journey, presence: true
  belongs_to :location
  belongs_to :journey

  before_save :ensure_duration_is_set

  def build_visit_to (location: nil )
    time = journey_time(to:location)
    if time > 0
      time = self.leaves_at + time
    end
    Visit.create!( location: location, journey: self.journey,
                   arrival: time)
  end

  def leaves_at
    if not arrival.blank?
      self.arrival + self.duration_seconds
    end
  end

  def journey_time (to: loc)
    response = city_mapper_lookup( from: self.location, to: to,
                                   time: self.leaves_at )
    minutes = response["travel_time_minutes"]
    minutes * 60
  end

  private

  def city_mapper_lookup( from: loc, to: loc, time: nil )
    # rate limit to 50 reqs per day for free acct. !!
    #    request = CityMapperRequest.new(start: from, finish: to, time: time)
    #    response = Net::HTTP.get_response(request.uri)
    fake_cm_response= %Q|{
      "travel_time_minutes": #{rand(30)},
          "diagnostic": {
                          "milliseconds": 3502
                        }
    }|
    JSON.parse(fake_cm_response)
  end

  def ensure_duration_is_set
    if self.duration_seconds.blank?
      self.duration_seconds = 15 * 60
    end
  end
end
