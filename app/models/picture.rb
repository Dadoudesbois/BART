class Picture < ApplicationRecord
  belongs_to :bar

  mount_uploader :photo, PhotoUploader

  def random_face_picture_url
    "https://source.unsplash.com/200x200/?face"
  end
end
