class Profile < ApplicationRecord
  belongs_to :user

  validates :username, presence: true, allow_blank: false
  validates :photo, presence: true
  validates :address, presence: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def self.artist
    Profile.where(is_artist: true)
  end

  def self.user(id)
    Profile.find(id).user
  end
end
