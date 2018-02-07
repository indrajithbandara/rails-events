class Event < ApplicationRecord
	
	validates :title, presence: true, length: { minimum: 3, maximum: 42 }
	
	validates :location, presence: true, length: { minimum: 3, maximum: 255 }

	validates :start_date, presence: true, format: { with: /A(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})z/,
    message: "Format YYYY/MM/DD hh:mm:ss" }

  validates :end_date, presence: true, format: { with: /A(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})z/,
    message: "Format YYYY/MM/DD hh:mm:ss" }

	belongs_to :user
	has_many :registrations
end
