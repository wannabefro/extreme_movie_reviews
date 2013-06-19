# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :movie do
    sequence(:title) {|n| "Ironman #{n}"}
    year 1999
  end

end
