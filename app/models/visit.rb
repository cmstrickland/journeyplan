class Visit < ActiveRecord::Base
  validates :arrival, presence: true
  validates :journey, presence: true
  belongs_to :location
  belongs_to :journey
end
