class WelcomeController < ApplicationController

  def index
    @multikino    = Multikino.new(Date.tomorrow)
    @forumcinemas = Forumcinemas.new(Date.tomorrow)    
  end

end
