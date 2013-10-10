class GamesController < ApplicationController
  before_filter :find_game, :only => [:edit, :update, :destroy]
  before_filter :find_foreigns, :only => [:new, :edit]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    if @game.save
      redirect_to (:controller => "main", :notice => "Game was successfully created.")
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    params[:game][:tag_ids] ||= []
    params[:game][:platform_ids] ||= []
    if @game.update_attributes(params[:game])
      redirect_to (:controller => "main", :notice => "Game was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @game.destroy
    redirect_to :controller => "main"
  end

  private
  def find_game
    @game = Game.find(params[:id])
  end
  
  def find_foreigns
    @tags = Tag.ordered
    @developers = Developer.ordered
    @platforms = Platform.ordered
  end

end
