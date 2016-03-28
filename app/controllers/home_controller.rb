class HomeController < ApplicationController
  def index
  	@homes = Home.near([-40.900557,174.885971], 20)
  end
end
