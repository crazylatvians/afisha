class EventsController < ApplicationController

  def index    
    render json: Event.all
# [{
#   id: 1,
#   title_lv: 'lv 1',
#   title_en: '1'
# }, {
#   id: 2,
#   title_lv: 'lv 2',
#   title_en: '2'
# }, {
#   id: 3,
#   title_lv: 'lv 3',
#   title_en: '3'
# }, {
#   id: 4,
#   title_lv: 'lv 4',
#   title_en: '4'
# }, {
#   id: 5,
#   title_lv: 'lv 5',
#   title_en: '5'
# }, {
#   id: 6,
#   title_lv: 'lv 6',
#   title_en: '6'
# }]
  end

  def show
    # @multikino = Multikino.new(Date.tomorrow)
    # @multikino_showtimes = @multikino.get_showtimes
    
    # @forumcinemas = Forumcinemas.new(Date.tomorrow)
    # @forumcinemas_showtimes = @forumcinemas.get_showtimes

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
