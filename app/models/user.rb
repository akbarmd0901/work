class User < ApplicationRecord
	has_secure_password
	has_many :courses
	has_many :videos
	#validates :name, presence: true
	#validates :password, length: {minimum: 5, maximum: 15}
end
