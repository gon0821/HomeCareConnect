class AddTimeSlotToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :time_slot, :integer
  end
end
