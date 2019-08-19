class Message < ApplicationRecord
  belongs_to :sender, class_name: "User", primary_key: "sender_id"
  belongs_to :recipient, class_name: "User", primary_key: "recipient_id"

  validates :content, allow_blank: false
end
