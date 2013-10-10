module MainHelper
  def sort_link(column, direction)
    if (direction == "desc")
      image = "arrow_up.png"
      title = "up"
    else
      image = "arrow_down.png"
      title = "down"
    end
    link_to( image_tag(image, :title => title),  :order => column, :direction => direction, :country => params[:country], :tag => params[:tag], :developer => params[:developer], :year => params[:year], :platform => params[:platform], :controller => "main")
  end
end
