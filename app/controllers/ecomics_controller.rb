class EcomicsController < ApplicationController
  before_action :set_ecomic, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:new, :create]
  before_action :authorize, only: [:edit, :update, :destroy]


  respond_to :html

  def myecomics
    @ecomics = Ecomic.where(user: current_user)
    respond_with(@ecomics)
  end

  def index
    @ecomics = Ecomic.all
    respond_with(@ecomics)
  end

  def show
    respond_with(@ecomic)
  end

  def new
    @ecomic = Ecomic.new
    respond_with(@ecomic)
  end

  def edit
    @frame = Frame.new
  end

  def create
    @ecomic = Ecomic.new(ecomic_params)
    @ecomic.user = current_user

    @ecomic.save
    respond_with(@ecomic)
  end

  def update
    @ecomic.update(ecomic_params)
    respond_with(@ecomic)
  end

  def destroy
    @ecomic.destroy
    respond_with(@ecomic)
  end

  private
    def set_ecomic
      @ecomic = Ecomic.find(params[:id])
    end

    def ecomic_params
      params.require(:ecomic).permit(:name, :description, :comic_type, :picture)
    end
  
    def authorize
      if !user_signed_in? 
        redirect_to root_path, alert: t("devise.failure.unauthenticated")
      elsif current_user != @ecomic.user
        redirect_to root_path, alert: t("devise.wrong_user")
      end
    end
end
