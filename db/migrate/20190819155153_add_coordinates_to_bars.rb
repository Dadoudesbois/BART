class AddCoordinatesToBars < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :latitude, :float
    add_column :bars, :longitude, :float
  end
end
