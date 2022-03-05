class Comment < ApplicationRecord
  belongs_to :video
  has_many :likes, as: :likable 
end
