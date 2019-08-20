class RemoveNameFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :name, :string
  end
end
