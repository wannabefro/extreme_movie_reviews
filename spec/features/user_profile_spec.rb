require 'spec_helper'

describe 'User Profile' do
  let!(:valid_user) { FactoryGirl.create(:user) }
  let!(:valid_movie) { FactoryGirl.create(:movie) }
  let!(:valid_review) { FactoryGirl.create(:review) }
  let!(:recent_review) { FactoryGirl.create(:recent_review) }

  before do
    sign_in_as valid_user
  end

  it "shows the current user's information" do
    visit user_path(valid_user)

    expect(page).to have_content("Profile for", valid_user.email)
  end

  context "Reviews" do

    it 'shows the most recently visted movie reviews' do
      visit movie_review_path(valid_review)

      visit user_path(valid_user)

      expect(page).to have_content(valid_review.title)
    end
  end
  
end