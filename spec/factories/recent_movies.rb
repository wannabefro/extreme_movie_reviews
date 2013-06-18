# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recent_movie, :class => 'RecentMovies' do
    user_id 1
    movie_id 1
  end
end
