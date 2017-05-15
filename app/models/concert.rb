class Concert < ApplicationRecord
  validates :band, :date, :venue, :start_time, presence: true

  has_many :attendances
  has_many :attendees, through: :attendances
  
end
