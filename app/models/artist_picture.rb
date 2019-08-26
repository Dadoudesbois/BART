class ArtistPicture < ApplicationRecord
  belongs_to :profile
  mount_uploader :photo, PhotoUploader
end
