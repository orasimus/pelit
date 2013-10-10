class PlatformsController < ApplicationController
  before_filter :find_platform, :only => [:edit, :update, :destroy]

  def index
    @platforms = Platform.find(:all, :order => "name")
  end

  def new
    @platform = Platform.new
  end

  def create
    @platform = Platform.new(params[:platform])
    if @platform.save
      redirect_to(platforms_path, :notice => "Platform was successfully created.")
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @platform.update_attributes(params[:platform])
      redirect_to (platforms_path, :notice => "Platform was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @platform.destroy
    redirect_to(platforms_path)
  end

  private
  def find_platform
    @platform = Platform.find(params[:id])
  end

end
