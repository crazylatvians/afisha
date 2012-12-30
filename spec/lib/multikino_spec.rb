require 'spec_helper'

describe "Miltikino" do

  before(:each) do
    @afisha = Multikino.new(Date.tomorrow)
  end

  it "should return list of lv movies" do
    @afisha.get_showtimes.size.should > 0
    # puts @afisha.get_lv_movies
  end
  
end
