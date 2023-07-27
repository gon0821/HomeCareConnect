class SchedulesController < ApplicationController

  def index
    schedules_today = Schedule.where(date: Date.today)
    schedules_sorted_by_time = schedules_today.sort_by do |schedule|
      schedule.medication.send("time#{schedule.time_slot}").seconds_since_midnight
    end
    @schedules = schedules_sorted_by_time
  end

  def update_confirmation
    checked_schedules = Schedule.where(id: params[:schedules])
    unchecked_schedules = Schedule.where(date: Date.today).where.not(id: params[:schedules])

    checked_schedules.update_all(confirmation: true)
    unchecked_schedules.update_all(confirmation: false)

    redirect_to schedules_path
  end

end
