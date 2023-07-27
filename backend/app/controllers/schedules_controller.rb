class SchedulesController < ApplicationController
  # ログインしていないユーザーをログインページに促す
  before_action :authenticate_user!
  # URLからパラメーターを取得し、@patientに代入する
  before_action :set_patient

  # 今日の服用スケジュールを取得し、一覧表示する
  def index
    date = params[:date]&.to_date || Date.today
    schedules_on_date = Schedule.joins(:medication).where(medications: { secret_patient_id: @patient.secret_id}, date: date)
    schedules_sorted_by_time = schedules_on_date.sort_by do |schedule|
      schedule.medication.send("time#{schedule.time_slot}").seconds_since_midnight
    end
    @schedules = schedules_sorted_by_time
    @date = date
  end

  # 服用スケジュールの確認状況を更新する
  def update_confirmation
    date = params[:date]&.to_date || Date.today
    checked_schedules = Schedule.joins(:medication).where(medications: { secret_patient_id: @patient.secret_id }, id: params[:schedules])
    unchecked_schedules = Schedule.joins(:medication).where(medications: { secret_patient_id: @patient.secret_id }, date: date).where.not(id: params[:schedules])

    checked_schedules.update_all(confirmation: true)
    unchecked_schedules.update_all(confirmation: false)

    redirect_to patient_schedules_path(@patient, date: date)
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
end
