class Restaurant < ApplicationRecord
  belongs_to :user
  belongs_to :state
  has_many :reviews, dependent: :destroy 
  has_many :users, through: :reviews

  validates_presence_of :state_id 
   

end

