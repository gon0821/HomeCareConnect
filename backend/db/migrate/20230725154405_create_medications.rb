class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name, null: false
      t.string :dosage, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.text :memo
      t.time :time1
      t.time :time2
      t.time :time3
      t.time :time4
      t.time :time5
      t.string :secret_patient_id
      t.timestamps
    end

    add_foreign_key :medications, :patients, column: :secret_patient_id, primary_key: :secret_id, on_delete: :cascade
  end
end
