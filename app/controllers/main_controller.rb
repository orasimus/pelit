class MainController < ApplicationController
  def index
    order = params[:order] || "name"
    if (order == "developer")
      order = "d1.name"
    end
    name_order = ""
    if (order != "name")
      name_order = ", name"
    end
    direction = params[:direction] || "asc"
    if (params[:country])
      d = Developer.by_country(params[:country])
      @games = Game.by_developer(d).order_by(order, direction, name_order)
    elsif (params[:tag])
      t = Tag.find(params[:tag])
      @games = Game.by_tag(t).order_by(order, direction, name_order)
    elsif (params[:developer])
      d = Developer.find(params[:developer])
      @games = Game.by_developer([d]).order_by(order, direction, name_order)
    elsif (params[:year])
      @games = Game.by_year(params[:year]).order_by(order, direction, name_order)
    elsif (params[:platform])
      p = Platform.find(params[:platform])
      @games = Game.by_platform(p).order_by(order, direction, name_order)
    else
      @games = Game.order_by(order, direction, name_order)
    end
    @countries = Developer.countries
  end

protected
  def authorize
  end
end
