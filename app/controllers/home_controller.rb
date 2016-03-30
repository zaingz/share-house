class HomeController < ApplicationController
  def index
  	@homes = Home.all
  	if Home.count > 0
	  	@min_price_home = Home.order(:rate).first.rate
	  	@max_price_home = Home.order(:rate).last.rate
  	end
  end
end
