require 'spec_helper'

feature "Movie up-voting" do

  let!(:movie) { FactoryGirl.create(:movie) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "when I am signed in" do
    prev_count = movie.likes.count
    sign_in_as(user)
    visit movie_path(movie)
    click_button "Like"

    expect(movie.likes.count).to eql(prev_count + 1)
  end

  scenario  "when I try to like a movie a second time" do
    sign_in_as(user)
    visit movie_path(movie)
    click_button "Like"
    prev_count = movie.likes.count
    click_button "Like"


    expect(movie.likes.count).to eql(prev_count)
    expect(page).to have_content("There can only be one!")
  end



end
