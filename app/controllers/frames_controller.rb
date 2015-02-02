class FramesController < ApplicationController

  respond_to :html

  def create
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
      redirect_to edit_ecomic_path(Ecomic.find(frame_params[:ecomic_id])), notice: "frames successfuly created"
    else
      redirect_to edit_ecomic_path(Ecomic.find(frame_params[:ecomic_id])), alert: "frames not created : #{message}" 
    end

  end

  def destroy
    frame = Frame.find(params[:id])
    ecomic = frame.ecomic
    frame.update_attribute('picture', nil)
    frame.destroy

    redirect_to edit_ecomic_path(ecomic), notice: "frame successfuly deleted"
  end

  def edit
    @frame = Frame.find(params[:id])
  end

  def update
    @frame = Frame.find(params[:id])
    if @frame.update(frame_params)
      redirect_to edit_ecomic_path(@frame.ecomic), notice: "frame successfuly updated"
    else
      redirect_to edit_frame_path(@frame), alert: "frame not updated"
    end
  end

  def update_all
    #A REFAIRE

    #@ecomic = nil
    #params['frame'].keys.each do |id|
    #  @ecomic = @frame.ecomic
    #  @frame = Frame.find(id.to_i)
    #  @frame.update_attributes(params['frame'][id])
    #end
    #redirect_to(edit_ecomic_path(@ecomic))
  end


  private
    def frame_params
      params.require(:frame).permit(:name, :duration, :ecomic_id, :picture, pictures: [])
    end

end
