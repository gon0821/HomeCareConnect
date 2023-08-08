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
    schedule_id = params[:schedule_id]
    checked = params[:checked]
    schedule = Schedule.find(schedule_id)

    if checked == "true" # JavaScriptから送信された値は文字列として扱われることがあるため
      schedule.update(confirmation: true)
    else
      schedule.update(confirmation: false)
    end

    respond_to do |format|
      format.json { render json: { success: true } } # JSON形式で成功レスポンスを返す
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
end
