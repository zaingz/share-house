class HomeController < ApplicationController
  def index
  	@homes = Home.near('Lahore, Punjab, Pakistan', 50, :units => :km)
  end
end
