class Photo < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :home 
	validates_associated :home
end
