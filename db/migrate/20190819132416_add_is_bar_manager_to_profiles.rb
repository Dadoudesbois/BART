class AddIsBarManagerToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :is_bar_manager, :boolean, default: false
  end
end
