require "spec_helper"

describe "Visiting the home page" do
  
  it "should visit the home page" do
    visit root_path
    expect(page).to have_content("eXtreme Reviews")
  end


end

describe 'viewing the last three movies added' do 
let!(:movie1) { FactoryGirl.create(:movie) }
let!(:movie2) { FactoryGirl.create(:movie, :title => 'Ironman2') }
let!(:movie3) { FactoryGirl.create(:movie, :title => 'Ironman3') }
let!(:valid_user) { FactoryGirl.create(:user) }


	it 'should give the user an area to see displayed movies' do 
		visit root_path
		page.should have_content('Recently Added eXtreme Movies')
	end

	it 'should display the last three movies to the user' do 
		visit root_path
		page.should have_content movie1.title
		page.should have_content movie2.title
		page.should have_content movie3.title
	end

  it "should link to the movie's show page" do
    sign_in_as valid_user
    visit root_path
    click_link movie1.title
    expect(current_path).to eq(movie_path(movie1))
  end

  it "should link to the movie's reviews page" do
    sign_in_as valid_user
    visit root_path
    find(".row0").click_link "View eXtreme Reviews"
    expect(current_path).to eq(movie_reviews_path(movie3))
  end

  it "should link to add a new review for movie" do
    sign_in_as valid_user
    visit root_path
    find(".row0").click_link "Add eXtreme Review"
    uri = URI.parse(current_url)
    expect("#{movie_path(movie3)}#new-review").to eq(movie_path(movie3) + "#new-review")
  end

  it "should allow you to like a movie if logged in" do
    sign_in_as valid_user
    visit root_path
    prev_likes = movie3.likes.count
    find(".row0").click_button "Like"
    expect(movie3.likes.count).to eq(prev_likes + 1)
  end

  it "shouldn't allow you to like a movie if not logged in" do
    visit root_path
    expect(page).to_not have_content(".like-btn")
  end
end
