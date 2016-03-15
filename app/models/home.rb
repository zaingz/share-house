class Home < ActiveRecord::Base
	belongs_to :user
	geocoded_by :address,
		:latitude => :lat, :longitude => :long
	after_validation :geocode
end
