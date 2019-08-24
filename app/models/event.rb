class Event < ApplicationRecord
  include PgSearch

  belongs_to :user
  belongs_to :bar
  has_many :reviews, dependent: :destroy
  has_many :profiles, through: :user

  validates :name, presence: true

  validate :end_date_after_start_date?

  mount_uploader :photo, PhotoUploader

  pg_search_scope :search_event_scope,
    against: :name,
    # associated_against: {
    #   bar: [:name, :address],
    #   profile: [:username]
    # },
    using: {
      tsearch: { prefix: true }
    }

  def end_date_after_start_date?
    if end_date < start_date
      errors.add :end_date, "has to be after start date"
    end
  end
end
