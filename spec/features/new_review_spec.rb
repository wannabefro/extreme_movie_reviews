require 'spec_helper'

describe "Creating a new review" do

  let!(:valid_movie) { FactoryGirl.create(:movie) }
    
  it "creates a new review when all required fields are filled in" do
    visit movie_path(valid_movie)
    prev_count = Review.count
  
    fill_in "Title", with: "This is an awesome movie"
    fill_in "Body", with: "The guy is totally made of metal!"

    click_on "Add a Review"

    expect(Review.count).to eql(prev_count + 1)
    expect(page).to have_content(valid_movie.title)
    expect(page).to have_content("This is an awesome movie")
  end

  it "does not create a new review if the required fields are not filled in" do
    visit movie_path(valid_movie)
    prev_count = Review.count

    click_on "Add a Review"

    expect(Review.count).to eql(prev_count)
  end

end