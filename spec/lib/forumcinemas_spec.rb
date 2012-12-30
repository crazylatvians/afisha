require 'spec_helper'

describe "Forumcinemas" do
  
  before(:each) do
    @afisha = Forumcinemas.new(Date.tomorrow)
  end

  it "should return list of lv movies" do
    @afisha.get_showtimes.size.should > 0
  end

end
