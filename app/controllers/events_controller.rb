class EventsController < ApplicationController

  def index    
    @events = Event.all
  end

  def show
    @multikino = Multikino.new(Date.tomorrow)
    @multikino_showtimes = @multikino.get_showtimes
    
    @forumcinemas = Forumcinemas.new(Date.tomorrow)
    @forumcinemas_showtimes = @forumcinemas.get_showtimes

    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    @event.set_friendly_id(params[:event][:title_ru], :ru)

    if @event.save
      redirect_to @event.slug
    else
      render action: "new"
    end
  end

  def update
    @event = Event.find(params[:id])
    
    if @event.update_attributes(params[:event])
      redirect_to @event.slug
    else
      render action: "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to "/"
  end

end
