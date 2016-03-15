class HomesController < ApplicationController
	before_action :authenticate_user!
	def index
		@homes = Home.all
  	end

  	def new
  		@homes = Home.new
  	end

  	def create
  		@homes = Home.new(home_params)
  		@homes.user_id = current_user.id
  		respond_to do |format|
	      if @homes.save
	        format.html { redirect_to @homes, notice: 'Home was successfully created.' }
	        format.json { render :index, status: :created, location: @homes }
	      else
	        format.html { render :new }
	        format.json { render json: @homes.errors, status: :unprocessable_entity }   
	      end
	    end
  	end

  	def show
  		#redirect_to homes_path
  		redirect_to url_for(:controller => :home, :action => :index)
  		return
  	end

  	def show_near_by_homes		
		respond_to do |format|
			homes = Home.near('New Zealand', 50, :units => :km)
			format.json { render json: home.to_json() }
		end
  	end


  	private

  	def home_params
      params.require(:home).permit(:name, :address, :host, :contact, :email, :website, :description, :rate, :wifi, :laundry, :power, :bathroom, :toilet, :heating, :bed, :min_stay , :pets, :bond)
    end
end
