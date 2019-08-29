class ChangeStartDateToBeDatetimeInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :start_date, :datetime
  end
end
