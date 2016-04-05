class Journey < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  belongs_to :negotiator
  validates :negotiator, presence: true
  validates :starts, presence: true
  validates :visits , presence: true

  before_validation :set_start_point

  private

  def set_start_point
    if visits.blank?
      visits << Visit.new( location: Location.london_office,
                           arrival: Time.now)
    end
  end
end
