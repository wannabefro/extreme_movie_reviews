describe 'Review to Movie' do 

	let!(:valid_movie) { FactoryGirl.create(:movie) }
  let!(:valid_user) { FactoryGirl.create(:user) }
  let!(:prev_count) {Review.count}
 		before do

   visit new_user_session_path
      fill_in "Email", with: valid_user.email
      fill_in "Password", with: valid_user.password
      click_on "Sign in"

end
      it 'should only allow one review per movie' do 
      	visit movie_path(valid_movie.id)
      	fill_in 'Title', :with => 'Whatever I want'
      	fill_in 'Body', :with => 'Whatever else I want'
      	click_button 'Add a Review'
      	visit movie_path(valid_movie.id)
      	fill_in 'Title', :with => 'Horrible movie'
      	fill_in 'Body', :with => 'YES'
      	click_button 'Add a Review'
      	expect(page).to have_content('You have already reviewed this movie')
      	expect(current_path).to eql(movie_path(valid_movie.id))
      end

end