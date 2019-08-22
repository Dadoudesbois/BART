class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatbox

  validates :content, presence: true, allow_blank: false
  # validates_presence_of :content
end
