class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :start_date
      t.string :end_date
      t.string :status
      t.text :description
      t.string :photo
      t.string :name
      t.references :user, foreign_key: true
      t.references :bar, foreign_key: true

      t.timestamps
    end
  end
end
