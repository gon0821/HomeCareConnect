class SchedulesController < ApplicationController
  # ログインしていないユーザーをログインページに促す
  before_action :authenticate_user!
  # URLからパラメーターを取得し、@patientに代入する
  before_action :set_patient

  # 今日の服用スケジュールを取得し、一覧表示する
  def index
    schedules_today = Schedule.joins(:medication).where(medications: { secret_patient_id: @patient.secret_id}, date: Date.today)
    schedules_sorted_by_time = schedules_today.sort_by do |schedule|
      schedule.medication.send("time#{schedule.time_slot}").seconds_since_midnight
    end
    @schedules = schedules_sorted_by_time
  end

  # 服用スケジュールの確認状況を更新する
  def update_confirmation
    checked_schedules = Schedule.joins(:medication).where(medications: { secret_patient_id: @patient.secret_id }, id: params[:schedules])
    unchecked_schedules = Schedule.joins(:medication).where(medications: { secret_patient_id: @patient.secret_id }, date: Date.today).where.not(id: params[:schedules])

    checked_schedules.update_all(confirmation: true)
    unchecked_schedules.update_all(confirmation: false)

    redirect_to patient_schedules_path(current_patient)
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
end
