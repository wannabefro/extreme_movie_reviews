require "spec_helper"

describe "Create a New Movie" do
  
  it "has a form" do
    visit new_movie_path

    expect(page).to have_content('Title')
  end

  it "creates a new movie when form is submitted" do
    previous_count = Movie.count
    visit new_movie_path

    fill_in 'Title', :with => 'Ironman'
    fill_in 'Year', :with => 2008

    click_button 'Add Movie'

    expect(Movie.count).to eq(previous_count + 1)
  end

  it "redirects to movie page when form submitted" do
    visit new_movie_path

    fill_in 'Title', :with => 'Ironman'
    fill_in 'Year', :with => 2008

    click_button 'Add Movie'

    expect(page).to have_content('Ironman')
  end

  it "does not create a new movie with invalid input" do
    visit new_movie_path

    click_button 'Add Movie'

    expect(page).to have_content('Invalid Criteria')
  end

  it "does not create a new movie if the title isn't unique" do
    FactoryGirl.create(:movie)
    visit new_movie_path

    fill_in 'Title', :with => 'Ironman'
    fill_in 'Year', :with => 1999

    click_button "Add Movie"

    expect(page).to have_content('Movie already created')
  end

end