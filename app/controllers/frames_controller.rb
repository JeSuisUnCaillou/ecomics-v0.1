class FramesController < ApplicationController

  respond_to :html

  def create
    #@frame = Frame.new(frame_params)
    #@frame.name = frame_params[:picture].original_filename if frame_params[:name].nil? && !frame_params[:picture].nil?

    message = ""
    error = false

    if frame_params[:pictures]
      frame_params[:pictures].each { |pic|
        frame = Frame.new(picture: pic,
                          name: pic.original_filename,
                          ecomic_id: frame_params[:ecomic_id],
                          duration: 0)
        if frame.save
         message = message + " ok"
        else
          message = message + " #{frame_params[:pictures]}"
          error = true
        end
        
      }
    else
      message += "pictures empty"
      error = true
    end
    
    if !error
      redirect_to ecomic_path(Ecomic.find(frame_params[:ecomic_id])), notice: "frames successfuly created"
    else
      redirect_to ecomic_path(Ecomic.find(frame_params[:ecomic_id])), alert: "frames not created : #{message}" 
    end
    #if @frame.save
    #  redirect_to ecomic_path(@frame.ecomic), notice: "frame successfuly created"
    #else 
    #  redirect_to ecomic_path(@frame.ecomic), alert: "frame not created"
    #end
  end

  private
    def frame_params
      params.require(:frame).permit(:name, :duration, :ecomic_id, pictures: [])
    end

end
