class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name, null: false, unique: true
      t.string :dosage, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.text :memo
      t.timestamps
    end
  end
end
