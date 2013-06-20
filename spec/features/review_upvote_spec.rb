require 'spec_helper'

feature "Review up-voting" do

  let!(:movie)  { FactoryGirl.create(:movie) }
  let!(:user)   { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.build(:review) }

  scenario "when I am signed in" do
    sign_in_as(user)
    visit movie_path(movie)
    write_review(review)
    visit movie_reviews_path(movie)
    review = Review.last
    prev_count = review.likes.count

    first('.actions').click_on('Like')


    expect(review.likes.count).to eql(prev_count + 1)
    expect(page).to have_content("Like added")
  end


end
