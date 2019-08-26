class CreateArtistPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_pictures do |t|
      t.string :photo
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
