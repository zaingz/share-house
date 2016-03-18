class HomesController < ApplicationController
	before_action :authenticate_user! ,except: [:index ,:show_near_by_homes, :show_filter]
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
  			homes = Home.all
  			format.json { render json: homes.to_json() }
  		end
  	end

    def show_filter
      p params["price_min"]..params["price_max"]

      respond_to do |format|
        homes = Home.search([(params["price_min"].to_i)..(params["price_max"].to_i)], params["min_days"],params["pets"],params["bond"],params["internet"],params["tv"],params["laundry"], params["heater"], params["parking"],params["air"], params["typ"])
        format.json { render json: homes.to_json() }
      end
    end


  	private

  	def home_params
      params.require(:home).permit(:title, :address, :host, :contact, :email, :website, :description, :rate, :min_stay , :pets, :bond ,:internet, :tv ,:laundry ,:heater ,:parking ,:air_cond,:h_type,:image)
    end
end
