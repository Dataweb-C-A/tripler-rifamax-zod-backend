class CreateRaffles < ActiveRecord::Migration[8.0]
  def change
    create_table :raffles do |t|
      t.date :award_date
      t.string :status
      t.string :award
      t.integer :winner
      t.references :place, null: false, foreign_key: true

      t.timestamps
    end
  end
end
