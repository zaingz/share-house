class AdminController < ApplicationController
	before_filter :is_admin?
	def index
		
		@homes = Home.near(params[:locat], 20).order( 'created_at DESC' )
	end
end
