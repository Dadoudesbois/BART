class RemoveLastNameFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :last_name, :string
  end
end
