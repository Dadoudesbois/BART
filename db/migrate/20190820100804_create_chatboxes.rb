class CreateChatboxes < ActiveRecord::Migration[5.2]
  def change
    create_table :chatboxes do |t|
      t.references :sender
      t.references :recipient
    end
    add_foreign_key :chatboxes, :users, column: :sender_id, primary_key: :id
    add_foreign_key :chatboxes, :users, column: :recipient_id, primary_key: :id
  end
end
