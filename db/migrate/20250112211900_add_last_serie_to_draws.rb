class AddLastSerieToDraws < ActiveRecord::Migration[8.0]
  def change
    add_column :draws, :last_serie, :integer
  end
end
