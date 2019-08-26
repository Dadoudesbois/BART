class Bar < ApplicationRecord
  belongs_to :user
  has_many :events, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :reviews, through: :events, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true

  validates :name, uniqueness: { scope: :address, message: "A profile for this bar seems to exist already" }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # def average_rating
  #   bar = self
  #   Review.bar_reviews(bar).average(:rating)
  # end

  def bar_reviews
    # self.events.map(&:reviews).flatten.select { |rev| rev.user_id != self.id }
    self.events.map(&:reviews).flatten.reject { |rev| rev.user_id == self.user.id }
  end

  def bar_average_rating
    reviews = self.bar_reviews
    reviews.map(&:rating).sum / reviews.count
  end
end
