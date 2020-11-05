class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :state
  has_many :reviews, dependent: :destroy 
  has_many :users, through: :reviews

  validates :name, :description, :vegan_friendliness_rating, :state_id, :phone_number, presence: true, allow_blank: false
  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "incorrect format, correct example: 234-567-8900" }

  #scope method for user's reviews -- using current_user.id == review.user_id 

end

