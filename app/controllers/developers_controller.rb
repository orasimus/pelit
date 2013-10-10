class DevelopersController < ApplicationController
  before_filter :find_developer, :only => [:edit, :update, :destroy]

  def index
    @developers = Developer.ordered
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(params[:developer])
    if @developer.save
      redirect_to(developers_path, :notice => "Developer was successfully created.")
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @developer.update_attributes(params[:developer])
      redirect_to (developers_path, :notice => "Developer was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @developer.destroy
    redirect_to(developers_path)
  end

  private
  def find_developer
    @developer = Developer.find(params[:id])
  end

end
