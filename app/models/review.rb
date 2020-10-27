class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :body, presence: true
end
