class Journey < ActiveRecord::Base
  has_one :negotiator
  has_many :visits, dependent: :destroy
  validates :negotiator, presence: true
  validates :starts, presence: true
  validates :visits , presence: true
end
