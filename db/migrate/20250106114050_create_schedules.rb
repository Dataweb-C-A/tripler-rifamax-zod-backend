class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.string :hour 
      t.references :draw, null: false, foreign_key: true

      t.timestamps
    end
  end
end
