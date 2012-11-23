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
  end
end
