class WelcomeController < ApplicationController

  def index
    @afisha = Multikino.new(Date.tomorrow)
    logger.debug "+++++++++++++++++++"
    logger.debug @afisha.get_lv_movies.inspect
    logger.debug "+++++++++++++++++++"
    logger.debug @afisha.get_ru_movies.inspect
    logger.debug "+++++++++++++++++++"
        
  end

end
