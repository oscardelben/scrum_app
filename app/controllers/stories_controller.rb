class StoriesController < ApplicationController

  respond_to :html

  def index
    @stories = Story.all
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new params[:story]
    if @story.save
      flash[:notice] = 'Story was successfully created.'
    else
      flash[:error] = 'There was an error saving the story.'
    end

    respond_with @story, location: stories_path
  end

  def edit
    @story = Story.find params[:id]
  end

  def update
    @story = Story.find params[:id]
    if @story.update_attributes params[:story]
      flash[:notice] = 'Story was successfully updated.'
    else
      flash[:error] = 'There was an error updating the story.'
    end

    respond_with @story, location: stories_path
  end
end
