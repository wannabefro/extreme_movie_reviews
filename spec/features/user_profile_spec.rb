require 'spec_helper'
require 'pry'

describe 'User Profile' do
  let!(:valid_user) { FactoryGirl.create(:user) }
  let!(:movie) { FactoryGirl.create(:movie) }
  let!(:review) { FactoryGirl.create(:review, movie: movie) }

  before do
    sign_in_as valid_user
  end

  it "shows the current user's information" do
    visit user_path(valid_user)

    expect(page).to have_content("Profile for", valid_user.email)
  end

  context "Reviews" do

    it 'shows the most recently visted movie reviews' do
      visit movie_review_path(movie, review)
      visit user_path(valid_user)

      expect(page).to have_content("This movie rocks")
    end

   

     it "doesn't re-record a recently visted review" do
       previous = RecentReview.count
       visit movie_review_path(movie, review)
       expect(RecentReview.count).to eq(previous + 1)
       visit root_path
       visit movie_review_path(movie, review) 
       expect(RecentReview.count).to eq(previous + 1)
     end
    end

  context "Movies" do
    it 'shows the most recently visted movie reviews' do
      visit movie_path(movie)
      visit user_path(valid_user)

      expect(page).to have_content("Ironman")
    end
  end
  
end
