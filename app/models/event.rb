class Event < ApplicationRecord
  belongs_to :user
  belongs_to :bar

  mount_uploader :photo, PhotoUploader
end
