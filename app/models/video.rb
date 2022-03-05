class Video < ApplicationRecord
	mount_uploader :file, VideoUploader
	belongs_to :user, :optional => true
	belongs_to :course, :optional => true
	has_many :comments
	has_many :likes, as: :likable 
end