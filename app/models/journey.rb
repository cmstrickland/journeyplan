class Journey < ActiveRecord::Base
  has_many :visits, dependent: :destroy
  belongs_to :negotiator
  validates :negotiator, presence: true
  validates :starts, presence: true
  validates :visits , presence: true
end
