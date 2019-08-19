class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
