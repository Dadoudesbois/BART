class Event < ApplicationRecord
  belongs_to :users
  belongs_to :bars
end
