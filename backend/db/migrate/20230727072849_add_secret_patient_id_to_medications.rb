class AddSecretPatientIdToMedications < ActiveRecord::Migration[7.0]
  def change
    add_column :medications, :secret_patient_id, :string
    add_foreign_key :medications, :patients, column: :secret_patient_id, primary_key: :secret_id
  end
end
