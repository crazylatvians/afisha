class WelcomeController < ApplicationController

  def index
    @afisha = MultikinoLv.new(Date.tomorrow)
  end

end
