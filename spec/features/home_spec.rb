require "spec_helper"

describe "Visiting the home page" do
  
  it "should visit the home page" do
    visit root_path
    expect(page).to have_content("Extreme Movies")
  end

end