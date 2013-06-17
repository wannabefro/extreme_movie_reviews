require 'spec_helper'

describe "Browse movie" do 

	let!(:valid_user) { FactoryGirl.create(:user) }
	let!(:valid_movie) { FactoryGirl.create(:movie) }
	let!(:valid_review) { FactoryGirl.create(:review) }


	describe 'user navigating to the browse movie page' do 

		before do 
			sign_in_as valid_user
		end

		it 'it has a browese movie link' do
			visit root_path
			click_on 'Browse'
			page.should have_content 'Movies with Reviews'
		end
	end

	describe 'It will let the user view movies' do 

		before do 
			sign_in_as valid_user
			valid_movie
		end

		it 'will let the user see a movie that has been reviewed' do 
			visit movies_path
			page.should have_content('Ironman')
		end
	end

	it 'will let the user see a review for the movie' do 
		visit movies_path
		click_on 'Show movie'
		page.should have_content('Ironman')
	end

	# it 'will let the user see reviews' do 
	# 	visit movies_path
	# 	click_on 'Show movie'
	# 	fill_in 'eXtreme Review Headline', :with => valid_review.title
	# 	fill_in 'Your eXtreme Review', :with => valid_review.body
	# 	click_on 'Add a Review'
	# 	click_on 'All Reviews'
	# 	page.should have_content('This movie rocks')
	# end
end






	