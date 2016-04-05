class Visit < ActiveRecord::Base
  validates :arrival, presence: true
  validates :journey, presence: true
  belongs_to :location
  belongs_to :journey

  before_save :ensure_duration_is_set

  def build_visit_to (location: nil )

    Visit.create!( location: location, journey: self.journey,
                   arrival: self.leaves_at + journey_time(to:location)
                 )
  end

  def leaves_at
    self.arrival + self.duration_seconds
  end

  def journey_time (to: loc)
    response = city_mapper_lookup( from: self.location, to: to)
    response["travel_time_minutes"] * 60
  end

  private

  def city_mapper_lookup( from: loc, to: loc )
    fake_cm_response= %Q|{
      "travel_time_minutes": 43,
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
