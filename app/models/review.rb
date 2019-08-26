class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  # scope :bar_reviews, -> (bar) { where.not("user_id = ?", bar.user_id) }
  # scope :art_reviews, -> (profile) { where.not("user_id = ?", profile.user_id) }
  validates :content, presence: true
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5], message: "Must be between 0 and 5" }

  def artist
    event.user
  end
end
