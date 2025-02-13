class CreatePlaces < ActiveRecord::Migration[8.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :country
      t.string :state
      t.string :location

      t.timestamps
    end
  end
end
