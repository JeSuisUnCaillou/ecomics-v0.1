class FramesController < ApplicationController

  respond_to :html

  def create
    @frame = Frame.new(frame_params)
    @frame.name = frame_params[:picture].original_filename if frame_params[:name].nil? && !frame_params[:picture].nil?
    if @frame.save
      redirect_to ecomic_path(@frame.ecomic), notice: "frame successfuly created"
    else 
      redirect_to ecomic_path(@frame.ecomic), alert: "frame not created"
    end
  end

  private
    def frame_params
      params.require(:frame).permit(:name, :duration, :ecomic_id, :picture)
    end

end
