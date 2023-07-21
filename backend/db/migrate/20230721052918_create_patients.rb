class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :secret_id, null: false

      t.timestamps
    end
    add_index :patients, :secret_id, unique: true
  end
end
