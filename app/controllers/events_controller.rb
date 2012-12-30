class EventsController < ApplicationController

  def index
    # @multikino    = Multikino.new(Date.tomorrow)
    # @multikino_lv = @multikino.get_lv_movies
    # @multikino_ru = @multikino.get_ru_movies
    
    # @forumcinemas = Forumcinemas.new(Date.tomorrow)    
    # @forumcinemas_lv = @forumcinemas.get_lv_movies
    # @forumcinemas_ru = @forumcinemas.get_ru_movies
  end

  def show
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
      redirect_to event_path(@locale, @event.id)
    else
      render action: "new"
    end
  end

  def update
    @event = Event.find(params[:id])
    
    if @event.update_attributes(params[:event])
      redirect_to admin_banks_path
    else
      render action: "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to admin_banks_path
  end

end
