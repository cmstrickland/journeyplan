class Journey < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  belongs_to :negotiator
  validates :negotiator, presence: true
  validates :starts, presence: true
  validates :visits , presence: true

  before_validation :set_start_point

  attr_accessor :locations

  def build_visits
    location_set = JSON.parse(self.locations)
    visit = self.visits.last
    self.transaction do
      location_set.each do |l|
        lat = Float(l["lat"]).round(6)
        lng = Float(l["lng"]).round(6)
        location = Location.find_or_create_by( latitude: lat,
                                               longitude: lng )
        if location.id == nil
          raise "Location #{l} failed #{location}.errors"
        end
        visit = visit.build_visit_to(location: location)
      end
    end
    self.visits
  end

  private

  def set_start_point
    if visits.blank?
      visits << Visit.new( location: Location.london_office,
                           arrival: Time.now)
    end
  end




end
