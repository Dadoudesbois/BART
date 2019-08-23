class Review < ApplicationRecord
  belongs_to :bar
  belongs_to :user
  belongs_to :event

  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "Must be between 0 and 5" }

  def artist
    event.user
  end
end
