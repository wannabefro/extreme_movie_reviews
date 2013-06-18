FactoryGirl.define do 
	factory :review do 
		title 'This movie rocks'
		body 'Has some of the best sauce know to awesome'
	end

  factory :movie_with_review do
    after_create do |movie|
      create(:review, movie: movie)
    end
  end
end
