class HomesController < ApplicationController
	before_action :authenticate_user! ,except: [:index ,:show_near_by_homes, :show_filter ,:show]
  before_filter :is_admin?, only: [:destroy, :edit]

	def index
		respond_to do |format|
      homes = Home.all
      format.json { render json: homes.map{|f| HomesSerializer.new(f)}.to_json }
    end
	end

	def new
		@homes = Home.new
	end

  def edit
    @home = Home.find(params[:id])
  end

  def update
    @home = Home.find(params[:id])
    respond_to do |format|
      if @home.update(home_params)
        if params[:photo]
         params[:photo]['image'].each do |a|
          @photo = @homes.photos.create!(:image => a, :home_id => @homes.id)
        end
       end
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :index, status: :updated, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }   
      end
    end
  end

	def create
		@homes = Home.new(home_params)
		@homes.user_id = current_user.id
		respond_to do |format|
      if params[:photo]
        if @homes.save
          params[:photo]['image'].each do |a|
            @photo = @homes.photos.create!(:image => a, :home_id => @homes.id)
          end
          format.html { redirect_to @homes, notice: 'Home was successfully created.' }
          format.json { render :index, status: :created, location: @homes }
        else
          format.html { render :new }
          format.json { render json: @homes.errors, status: :unprocessable_entity }   
        end
      else
        flash[:error] = "Photos can't be blank!"
        format.html { render :new}
        format.json { render json: @homes.errors, status: :unprocessable_entity } 
      end

    end
	end

	def show
    @home = Home.find(params[:id])
	end

  def destroy
 
    @home = Home.find(params[:id])
    @home.destroy
  
    redirect_to :admin , notice: 'Home was successfully destroyed.'
  end

	def show_near_by_homes		
		respond_to do |format|
			homes = Home.near(params[:locat], 20)
			format.json { render json: homes.map{|f| HomesSerializer.new(f)}.to_json}
		end
	end

  def show_filter
    p params["price_min"]..params["price_max"]
    respond_to do |format|
      homes = Home.search([(params["price_min"].to_i)..(params["price_max"].to_i)], params["locat"],params["pets"],params["internet"],params["tv"],params["laundry"], params["heater"], params["parking"],params["air"])
      format.json { render json: homes.map{|f| HomesSerializer.new(f)}.to_json }
    end
  end


	private

	def home_params
    params.require(:home).permit(:title, :address, :host, :contact, :email, :website, :description, :rate, :min_stay , :pets, :bond ,:internet, :tv ,:laundry ,:heater ,:parking ,:air_cond,:h_type, photo: [:id, :home_id, :image])
  end
end
