class TagsController < ApplicationController
  before_filter :find_tag, :only => [:edit, :update, :destroy]

  def index
    @tags = Tag.find(:all, :order => "name")
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to(tags_path, :notice => "Tag was successfully created.")
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @tag.update_attributes(params[:tag])
      redirect_to (tags_path, :notice => "Tag was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @tag.destroy
    redirect_to(tags_path)
  end

  private
  def find_tag
    @tag = Tag.find(params[:id])
  end

end
