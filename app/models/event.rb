class Event < ApplicationRecord
  belongs_to :user
  belongs_to :bar

  validates :name, presence: true

  validate :end_date_after_start_date?

  mount_uploader :photo, PhotoUploader

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "has to be after start date"
    end
  end
end
