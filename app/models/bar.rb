class Bar < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true

  validates :name, uniqueness: { scope: :address, message: "A profile for this bar seems to exist already" }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
