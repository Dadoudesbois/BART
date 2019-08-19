class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :email
      t.string :address
      t.string :photo
      t.text :artist_description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
