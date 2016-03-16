class Home < ActiveRecord::Base
	belongs_to :user
	has_one :facility
	mount_uploader :image, ImageUploader
	validates_presence_of :image
	geocoded_by :address,
		:latitude => :lat, :longitude => :long
	after_validation :geocode
end
