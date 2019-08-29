class ChangeEndDateToBeDatetimeInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :end_date, :datetime
  end
end
