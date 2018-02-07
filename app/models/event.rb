class Event < ApplicationRecord

	belongs_to :user
	has_many :registrations
	
	validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 42 }
	
	validates :location, presence: true, length: { minimum: 3, maximum: 255 }

	validates :start_date, presence: true, format: { with: /A(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})z/,
    message: "Format YYYY/MM/DD hh:mm:ss" }

  validates :end_date, presence: true, format: { with: /A(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})z/,
    message: "Format YYYY/MM/DD hh:mm:ss" }

  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_in_the_past
 
  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

end
