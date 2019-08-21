class RemoveStartDateFromEvents < ActiveRecord::Migration[5.2]
  def change
    remove_column :events, :start_date, :string
  end
end
