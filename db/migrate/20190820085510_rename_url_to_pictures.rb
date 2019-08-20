class RenameUrlToPictures < ActiveRecord::Migration[5.2]
  def change
    rename_column :pictures, :url, :photo, :string
  end
end
