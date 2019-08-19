class RemoveEmailFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :email, :string
  end
end
