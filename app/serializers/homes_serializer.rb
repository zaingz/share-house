class HomesSerializer < ActiveModel::Serializer
  attributes :id ,:title, :address, :host, :contact, :email, :website, :description, :rate, :min_stay , :pets, :bond ,:internet, :tv ,:laundry ,:heater ,:parking ,:air_cond,:h_type,:lat,:long,:image
  	def image
		object.photos.first.image_url
	end
end