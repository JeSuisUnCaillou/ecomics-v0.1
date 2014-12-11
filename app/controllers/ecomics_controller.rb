class EcomicsController < ApplicationController
  before_action :set_ecomic, only: [:show, :edit, :update, :destroy]

  respond_to :html

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
  end

  def create
    @ecomic = Ecomic.new(ecomic_params)
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
      params.require(:ecomic).permit(:name, :description, :type, :user_id)
    end
end
