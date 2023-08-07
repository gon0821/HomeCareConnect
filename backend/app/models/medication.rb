class Medication < ApplicationRecord
  has_many :schedules, dependent: :destroy

  belongs_to :patient, foreign_key: :secret_patient_id, primary_key: :secret_id

  after_create :create_schedules

  after_update :update_schedules

  validates :name, presence: true
  validates :dosage, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  private

  # 薬が新規登録されたあとに、服用スケジュールを作成する
  def create_schedules
    (start_date..end_date).each do |date|
      [time1, time2, time3, time4, time5].each_with_index do |time, index|
        self.schedules.create(date: date, time_slot: index + 1, confirmation: false) if time.present?
      end
    end
  end

  # 薬の情報が更新されたあとに、服用スケジュールを更新する
  def update_schedules
    # 既存の服用スケジュールを全て削除する
    self.schedules.destroy_all
    # 服用スケジュールを再作成する
    create_schedules
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

end
