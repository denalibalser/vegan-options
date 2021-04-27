class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :restaurants
    has_many :restaurants, through: :reviews

    validates :username, :first_name, :last_name, :email, presence: true, allow_blank: false 
    validates :username, uniqueness: true
    validates :email, format:  { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "incorrect format, correct example: john@gmail.com" }
end
