class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatbox

  # validates :content, allow_blank: false
end
