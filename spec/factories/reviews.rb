FactoryGirl.define do 
	factory :review do 
		title 'This movie rocks'
		body 'Has some of the best sauce know to awesome'
    movie
    user
	end
end
