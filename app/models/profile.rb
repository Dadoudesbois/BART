class Profile < ApplicationRecord
  belongs_to :users

  validates :username, allow_blank: false
  validates :photo, presence: true
  validates :address, presence: true

  def self.artist
    Profile.where(is_artist: true)
  end
end
