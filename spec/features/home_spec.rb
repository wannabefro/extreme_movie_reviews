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
end
