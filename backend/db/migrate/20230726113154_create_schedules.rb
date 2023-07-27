class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :medication, null: false, foreign_key: true
      t.boolean :confirmation, default: false

      t.timestamps
    end
  end
end
