FactoryGirl.define do

  factory :event do
  end

  factory :place do
  end

  factory :showtime do
  end

  factory :user do 
    # sequence(:email) {|n| "foo#{n}@example.com"}
    # password 'secret'
  end

end
