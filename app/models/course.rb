class Course < ApplicationRecord
  belongs_to :user
  has_many :videos
  has_one_attached :image
end