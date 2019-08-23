class Event < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  has_many :reviews, dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
