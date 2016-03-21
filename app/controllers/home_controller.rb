class HomeController < ApplicationController
  def index
  	@homes = Home.all
  end
end
