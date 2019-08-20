class AddLastNameToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :last_name, :string
  end
end
