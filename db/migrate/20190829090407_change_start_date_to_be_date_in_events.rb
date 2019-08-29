class ChangeStartDateToBeDateInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :start_date, :date
  end
end
