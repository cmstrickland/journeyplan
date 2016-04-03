class Negotiator < ActiveRecord::Base
  validates :username, presence: true
  has_many :journeys
end
