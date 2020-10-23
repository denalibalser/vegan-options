class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :restaurants
    has_many :restaurants, through: :reviews

    validates_presence_of :username
    validates_uniqueness_of :user_name
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ #email format validator 
    #validation for password presence --- do we  need this with has_secure_password? 

    

end
