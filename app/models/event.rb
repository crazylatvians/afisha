class Event < ActiveRecord::Base
  
  attr_accessible :poster
  has_attached_file :poster, styles: { medium: "300x300>", thumb: "100x100>" }

end
