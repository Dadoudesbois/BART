class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatbox

  validates :content, presence: true, allow_blank: false
end
