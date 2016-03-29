class AdminController < ApplicationController
	before_filter :is_admin?
	def index	
		@homes = Home.all.order( 'created_at DESC' )
	end
end
