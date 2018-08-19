class SimplePagesController < ApplicationController
  def index
  end
  def landing_page
    @products = Product.limit(2)
    @featured_products = Product.where(featured: true)
  end


  def about
    # redirect_to '/simple_pages/contact'
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end