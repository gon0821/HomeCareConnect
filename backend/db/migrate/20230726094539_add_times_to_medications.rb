class AddTimesToMedications < ActiveRecord::Migration[7.0]
  def change
    add_column :medications, :time1, :time
    add_column :medications, :time2, :time
    add_column :medications, :time3, :time
    add_column :medications, :time4, :time
    add_column :medications, :time5, :time
  end
end
