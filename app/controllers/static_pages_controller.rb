class StaticPagesController < ApplicationController
  def index
  end

  def about
  end

  def contact
  end

  def landing_page
    @featured_product = Product.limit(3)
    @products = Product.limit(3)
  end
end
