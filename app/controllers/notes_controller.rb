class NotesController < ApplicationController
  before_filter :find_note, :only => [:edit, :update, :destroy]
  before_filter :find_foreigns, :only => [:new, :edit]

  def index
    @notes = Note.ordered
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to (notes_path, :notice => "Note was successfully created.")
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @note.update_attributes(params[:note])
      redirect_to (notes_path, :notice => "Note was successfully updated.")
    else
      render :action => "edit"
    end
  end

  def destroy
    @note.destroy
    redirect_to(notes_path)
  end

  private
  def find_note
    @note = Note.find(params[:id])
  end
  
  def find_foreigns
    @games = Game.ordered
  end
end
