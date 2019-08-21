class Picture < ApplicationRecord
  belongs_to :bar

  mount_uploader :photo, PhotoUploader
end
