require 'spec_helper'

feature "Movie up-voting" do

  let!(:movie) { FactoryGirl.create(:movie) }
  let!(:user) { FactoryGirl.create(:user) }
  
  scenario "when I am signed in" do
    prev_count = movie.likes.count
    sign_in_as(user)
    visit movie_path(movie)
    save_and_open_page
    click_button "Like"

    expect(movie.likes.count).to eql(prev_count + 1)
  end

  scenario "when I am not signed in"

end