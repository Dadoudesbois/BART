class Profile < ApplicationRecord
  belongs_to :users

  validates :username, allow_blank: false
  validates :photo, presence: true
end
