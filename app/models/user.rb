class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :restaurants, through: :reviews

    validates_presence_of :username
end
