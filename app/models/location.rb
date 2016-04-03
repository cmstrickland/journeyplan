class Location < ActiveRecord::Base
  validates :latitude, presence: true
  validates :longitude, presence: true,
            uniqueness: { scope: :latitude  }
  has_many :visits
end
