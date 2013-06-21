FactoryGirl.define do 
	factory :review do 
		sequence(:title) {|n| "This movie rocks#{n}"}
		body 'Has some of the best sauce know to awesome'
    state 'approved'
    movie
    user
	end
end
