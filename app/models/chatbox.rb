class Chatbox < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
  belongs_to :recipient, :class_name => 'User'
  has_many :messages, -> { order(:id => :asc) }, dependent: :destroy
end
