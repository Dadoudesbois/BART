class AddIsArtistToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :is_artist, :boolean, default: false
  end
end
