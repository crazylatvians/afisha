class WelcomeController < ApplicationController

  def index
    @afisha = Multikino.new(Date.tomorrow)
  end

end
