class Bar < ApplicationRecord
  belongs_to :user
  has_many :events

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true

  validates :name, uniqueness: { scope: :address, message: "A profile for this bar seems to exist already" }
end
