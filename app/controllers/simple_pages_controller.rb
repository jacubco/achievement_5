class SimplePagesController < ApplicationController
  def index
  end
  def landing_page
  	@products = Product.limit(4)
  	@featured_product = Product.first
  end
end