class CreateDraws < ActiveRecord::Migration[8.0]
  def change
    create_table :draws do |t|
      t.string :title
      t.string :key
      t.string :draw
      t.integer :length
      t.datetime :last_result_seen

      t.timestamps
    end
  end
end
