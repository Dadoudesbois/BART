class Profile < ApplicationRecord
  belongs_to :user

  validates :username, presence: true, allow_blank: false
  validates :photo, presence: true
end
