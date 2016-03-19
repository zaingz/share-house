
class Home < ActiveRecord::Base


	belongs_to :user
	has_one :facility
	mount_uploader :image, ImageUploader
	validates_presence_of :image, :rate
	validates :rate, :numericality => { :greater_than_or_equal_to => 0 }
	geocoded_by :address,
		:latitude => :lat, :longitude => :long
	after_validation :geocode


	
def self.search(rate, min_stay , pets,  bond , internet,  tv , laundry , heater , parking , air_cond, h_type)
		scope=  Home.all
		scope= scope.where(rate: rate) if rate 
		scope= scope.where(min_stay: min_stay) if min_stay!= nil
		scope= scope.where(pets: pets) if pets!="false"
		scope= scope.where(bond: bond) if bond!="false"
		scope= scope.where(internet: internet) if internet!="false"
		scope= scope.where(tv: tv) if tv!="false"
		scope= scope.where(laundry: laundry) if laundry!="false"
		scope= scope.where(heater: heater) if heater!="false"
		scope= scope.where(parking: parking) if parking!="false"
		scope= scope.where(air_cond: air_cond) if air_cond!="false"
		scope= scope.where(h_type: h_type) if h_type!=""
		scope

	end

end
