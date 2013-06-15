describe 'Review to Movie' do 

	let!(:valid_movie) { FactoryGirl.create(:movie) }
  let!(:valid_user) { FactoryGirl.create(:user) }
  let!(:prev_count) {Review.count}
 		before do

   visit new_user_session_path
      fill_in "Email", with: valid_user.email
      fill_in "Password", with: valid_user.password
      click_button "Sign in"

end
      it 'should only allow one review per movie' do 
        prev_count = valid_movie.reviews.count
      	visit movie_path(valid_movie.id)
      	fill_in 'eXtreme Review Headline', :with => 'Whatever I want'
      	fill_in 'Your eXtreme Review', :with => 'Whatever else I want'
      	click_button 'Add a Review'
      	visit movie_path(valid_movie.id)
      	fill_in 'eXtreme Review Headline', :with => 'Horrible movie'
      	fill_in 'Your eXtreme Review', :with => 'YES'
      	click_button 'Add a Review'
      	expect(page).to have_content('Cannot save review. You cannot review the same movie twice, and fields cannot be empty.')
      	expect(current_path).to eql(movie_path(valid_movie.id))
        expect(valid_movie.reviews.count).to eql(prev_count + 1)
      end

end