require 'spec_helper'

describe 'Visiting the admin page' do 
	let(:admin) { FactoryGirl.create(:admin) }
	let(:user) { FactoryGirl.create(:user) }
	let!(:movie) { FactoryGirl.create(:movie) }
	let(:review) {FactoryGirl.create(:review) }

	it 'should allow admin to visit admin page' do 
		sign_in_as admin
		visit extmin_index_path
		page.should have_content('All Users')
		expect(current_path).to eql(extmin_index_path)
	end

	it 'should not allow a non admin to vist'do 
		sign_in_as user 
		visit extmin_index_path
		page.should have_content('You aint no admin')
		expect(current_path).to eql(root_path)
	end

	it 'should allow me to see all users'do 
		user
		sign_in_as admin
		visit extmin_index_path
		page.should have_content(user.email)
	end

	it 'allow me to click on a user to see their user page'do 
		user
		sign_in_as admin
		visit extmin_index_path
		click_on user.email
		expect(current_path).to eql(extmin_path(user))
	end

	it 'user summary page should have recent activity', focus: true    do
		test = user 
		sign_in_as test
		visit movie_path(movie)
		fill_in 'eXtreme Review Headline', :with => review.title
		fill_in 'Your eXtreme Review', :with => review.body
		click_on 'Add a Review'
		visit root_path
		click_on 'Sign Out'
		sign_in_as admin
		visit extmin_index_path
		click_on user.email
		check = User.find(test.id)
		page.should have_content(review.title)
		page.should have_content(check.last_sign_in_at)
	end

end