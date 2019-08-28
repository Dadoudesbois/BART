class AddInstagramUsernameToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :instagram_username, :string
  end
end
