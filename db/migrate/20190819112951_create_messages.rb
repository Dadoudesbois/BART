class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :date
      t.text :content
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
