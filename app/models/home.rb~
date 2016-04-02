
class Home < ActiveRecord::Base

include ActiveModel::Serialization


	belongs_to :user

	has_many :photos , dependent: :destroy
	accepts_nested_attributes_for :photos


	validates_presence_of :address
	validates_length_of :photos, maximum: 4 
	validates_presence_of :rate
	validates :rate, :numericality => { :greater_than_or_equal_to => 0 }
	geocoded_by :address,
		:latitude => :lat, :longitude => :long
	after_validation :geocode


	
def self.search(rate, locat,   pets,   internet,  tv , laundry , heater , parking , air_cond)
		scope=  Home.all
		scope= scope.near(locat, 20) if locat!=""
		scope= scope.where(rate: rate) if rate 

		scope= scope.where(pets: pets) if pets!="false"

		scope= scope.where(internet: internet) if internet!="false"
		scope= scope.where(tv: tv) if tv!="false"
		scope= scope.where(laundry: laundry) if laundry!="false"
		scope= scope.where(heater: heater) if heater!="false"
		scope= scope.where(parking: parking) if parking!="false"
		scope= scope.where(air_cond: air_cond) if air_cond!="false"

		scope

	end

end
