require 'spec_helper'

describe "Creating a new review" do

  let!(:valid_movie) { FactoryGirl.create(:movie) }
  let!(:valid_user) { FactoryGirl.create(:user) }
  let!(:prev_count) {Review.count}
  
  describe "if a user is signed in" do  
    before do
      visit new_user_session_path

      fill_in "Email", with: valid_user.email
      fill_in "Password", with: valid_user.password

      click_on "Sign in"

    end

      it "creates a new review when all required fields are filled in" do
        visit movie_path(valid_movie)
      
        fill_in "Title", with: "This is an awesome movie"
        fill_in "Body", with: "The guy is totally made of metal!"
    
        click_on "Add a Review"
        
        expect(Review.count).to eql(prev_count + 1)
        expect(page).to have_content(valid_movie.title)
        expect(page).to have_content("This is an awesome movie")
      end
  
      it "does not create a new review if the required fields are not filled in" do
        visit movie_path(valid_movie)
    
        click_on "Add a Review"
    
        expect(Review.count).to eql(prev_count)
      end
  
  end



  it "does not allow a user to create a review if not signed in" do
    visit movie_path(valid_movie)

    fill_in "Title", with: "This is an awesome movie"
    fill_in "Body", with: "This guy is made of metal"

    click_on "Add a Review"

    expect(Review.count).to eql(prev_count)
    expect(page).to have_content("Sign in")
    expect(page).to have_content("You must sign in")
  end

end