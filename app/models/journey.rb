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
    location_set.each do |l|
      location = Location.find_or_create_by( latitude: l["lat"],
                                             longitude: l["lng"] )
      self.visits.last.build_visit_to(location: location)
    end
  end

  private

  def set_start_point
    if visits.blank?
      visits << Visit.new( location: Location.london_office,
                           arrival: Time.now)
    end
  end




end
