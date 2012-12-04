require 'spec_helper'

describe "Miltikino parser" do
  
  before(:each) do
    @afisha = MultikinoLv.new(Date.tomorrow)
  end

  it "should return list of movies" do
    @afisha.get_movies.size.should > 0
    # puts @afisha.get_movies
  end

end
