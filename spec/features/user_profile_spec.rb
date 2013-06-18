require 'spec_helper'
require 'pry'

describe 'User Profile' do
  let!(:valid_user) { FactoryGirl.create(:user) }
  let!(:valid_movie) { FactoryGirl.create(:movie) }
  let!(:valid_review) { FactoryGirl.create(:review) }
  let!(:recent_review) { FactoryGirl.create(:recent_review) }

  before do
    sign_in_as valid_user
  end

  it "shows the current user's information" do
    visit user_path(valid_user)

    expect(page).to have_content("Profile for", valid_user.email)
  end

  context "Reviews" do

    it 'shows the most recently visted movie reviews' do
      visit new_movie_path
      fill_in "Title", :with => "Superman"
      fill_in "Year", :with => 2013
      click_button "Add Movie"
      expect(page).to have_content("Superman")
      fill_in "eXtreme Review Headline", with: "This is an awesome movie"
      fill_in "Your eXtreme Review", with: "The guy is totally made of metal!"
      click_on "Add a Review"
      expect(page).to have_content("This is an awesome movie")
      click_on "All Reviews"
      click_on "This is an awesome movie"
      expect(page).to have_content("The guy is totally made of metal!")
      visit user_path(valid_user)
      
      expect(page).to have_content("This is an awesome movie")
    end

    it "doesn't re-record a recently visted review" do
      previous = RecentReview.count
      movie_with_review = create(:movie_with_review)
      visit movie_review_path(movie_with_review)
      expect(RecentReview.count).to eq(previous.count + 1)
      visit root_path
      visit movie_review_path(movie_with_review) 
      expect(RecentReview.count).to eq(previous.count + 1)
    end
  end
  
end
