require 'spec_helper'

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

    it 'displays the most recently visted review first' do
      movie1 = FactoryGirl.create(:movie)
      review1 = FactoryGirl.create(:review, movie: movie1)
      movie2 = FactoryGirl.create(:movie)
      review2 = FactoryGirl.create(:review, movie: movie2)

      visit movie_review_path(movie, review)
      visit movie_review_path(movie1, review1)
      visit movie_review_path(movie2, review2)

      visit user_path(valid_user)

      page.should have_css(".review1", :text => review2.title)
      page.should have_css(".review3", :text => review.title)

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
    it 'shows the most recently visted movie' do
      visit movie_path(movie)
      visit user_path(valid_user)

      expect(page).to have_content(movie.title)
    end

    it 'displays the most recently visted movie first' do
      movie1 = FactoryGirl.create(:movie)
      review1 = FactoryGirl.create(:review, movie: movie1)
      movie2 = FactoryGirl.create(:movie)
      review2 = FactoryGirl.create(:review, movie: movie2)

      visit movie_path(movie)
      visit movie_path(movie1)
      visit movie_path(movie2)

      visit user_path(valid_user)

      page.should have_css(".movie1", :text => movie2.title)
      page.should have_css(".movie3", :text => movie.title)

    end

    it "doesn't re-record a recently visted movie" do
       previous = RecentMovies.count
       visit movie_path(movie)
       expect(RecentMovies.count).to eq(previous + 1)
       visit root_path
       visit movie_path(movie) 
       expect(RecentMovies.count).to eq(previous + 1)
     end
  end
  
end
