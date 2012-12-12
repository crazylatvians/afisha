require 'spec_helper'

describe "Miltikino" do
  
  before(:each) do
    @afisha = Multikino.new(Date.tomorrow)
  end

  it "should return list of lv movies" do
    @afisha.get_lv_movies.size.should > 0
    # puts @afisha.get_lv_movies
  end

  it "should return list of ru movies" do
    @afisha.get_ru_movies.size.should > 0
  end

end
