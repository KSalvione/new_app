class StaticPagesController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def landing_page
    byebug
    @featured_product = Product.limit(3)
    @products = Product.limit(3)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
