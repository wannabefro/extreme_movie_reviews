# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :flag do
    review_id 1
    reason "MyString"
    user_id 1
  end
end
