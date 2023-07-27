class Medication < ApplicationRecord
  has_many :schedules, dependent: :destroy

  after_create :create_schedules

  validates :name, presence: true, uniqueness: true
  validates :dosage, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  private

  def create_schedules
    (start_date..end_date).each do |date|
      [time1, time2, time3, time4, time5].each_with_index do |time, index|
        self.schedules.create(date: date, time_slot: index + 1, confirmation: false) if time.present?
      end
    end
  end


  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

end
