require 'spec_helper'

describe "The admin page" do
  let!(:admin) { FactoryGirl.create(:admin) }
  let!(:movie) { FactoryGirl.create(:movie) }
  let!(:review) { FactoryGirl.create(:review, movie: movie, state: 'flagged') }
  let!(:flagged) { FactoryGirl.create(:flag, review: review) }
  let!(:flagged2) { FactoryGirl.create(:flag, review: review) }
  
  before do
    sign_in_as admin
  end

  it "shows all reviews that have been flagged" do
    visit extmin_index_path
    expect(page).to have_content("All Flagged Reviews")
  end

  it "has a button to approve a flagged review" do
    visit extmin_index_path 
    expect(page.find(".flagged0")).to have_button("Approve")
  end

  it "has a button to remove a flagged review" do
    visit extmin_index_path 
    expect(page.find(".flagged0")).to have_button("Remove")
  end

  context 'approves a flagged post' do
    it "if the admin clicks approve" do
      visit extmin_index_path
      prev = Flag.count

      expect(flagged.review).to be_flagged
      expect(page.find(".flagged0")).to have_content(flagged.reason)
      page.find(".flagged0").click_button("Approve")

      expect(flagged.review.reload).to be_approved
      expect(Flag.count).to eq(prev - 1)
    end

    it "it shows in the review views" do

    end
  end

  context "removes a flagged post" do
    it "it changes the state to removed" do
    end

    it "does not show in the review views" do
    end
  end
end
