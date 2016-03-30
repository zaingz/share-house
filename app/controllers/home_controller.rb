class HomeController < ApplicationController
  def index
  	@homes = Home.all
  	@min_price_home = Home.order(:rate).first.rate
  	@max_price_home = Home.order(:rate).last.rate
  end
end
