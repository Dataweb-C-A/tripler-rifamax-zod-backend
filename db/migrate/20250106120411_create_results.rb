class CreateResults < ActiveRecord::Migration[8.0]
  def change
    create_table :results do |t|
      t.integer :number
      t.string :sign
      t.string :hour
      t.references :draw, null: false, foreign_key: true

      t.timestamps
    end
  end
end
