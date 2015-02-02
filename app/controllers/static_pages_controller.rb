class StaticPagesController < ApplicationController
  def home
    @ecomics = Ecomic.all
  end
end
