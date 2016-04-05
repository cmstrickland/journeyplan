class Location < ActiveRecord::Base
  validates :latitude, presence: true
  validates :longitude, presence: true,
            uniqueness: { scope: :latitude  }
  has_many :visits

  BASE_LOCATION = { latitude: 51.51991, longitude: -0.09820 }

  def self.london_office
    location = Location.find_or_create_by( latitude: BASE_LOCATION[:latitude],
                                           longitude: BASE_LOCATION[:longitude])
  end
end
