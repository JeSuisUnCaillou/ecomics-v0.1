module ApplicationHelper
  def set_active(menu)
    "active" if params[:controller] + "/" + params[:action] == menu
  end

end
