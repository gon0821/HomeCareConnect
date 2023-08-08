class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :medication, null: false, foreign_key: { on_delete: :cascade }
      t.boolean :confirmation, default: false
      t.integer :time_slot
      t.date :date

      t.timestamps
    end
  end
end
