class SimplePagesController < ApplicationController
  def index
  end
  def landing_page
  	@products = Product.limit(2)
  	@featured_products = Product.find(1,2,5)
  end
end