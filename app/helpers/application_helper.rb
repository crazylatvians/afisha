module ApplicationHelper

  def event_slug event
    if @locale == 'ru'
      "/#{@locale}/#{event.slug_ru}"
    else
      "/#{@locale}/#{event.slug_lv}"
    end
  end

  def event_title event
    if @locale == 'ru'
      event.title_ru
    else
      event.title_lv
    end
  end

end
