class SimplePagesController < ApplicationController
  def index
  end
  def landing_page
  	@products = Product.limit(2)
  	@featured_products = Product.find(4,2,1)
  end

  def about
  	# redirect_to '/simple_pages/contact'
  end
end