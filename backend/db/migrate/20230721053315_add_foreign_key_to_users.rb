class AddForeignKeyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :users, :patients, column: :secret_patient_id, primary_key: :secret_id
  end
end
