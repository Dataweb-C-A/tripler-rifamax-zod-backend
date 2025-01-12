class AddSerieToResults < ActiveRecord::Migration[8.0]
  def change
    add_column :results, :serie, :integer
  end
end
