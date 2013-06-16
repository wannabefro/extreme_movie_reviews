require 'spec_helper'

describe 'admin duties' do

  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user) }

  it 'should be able to reach an admin page if I am an admin' do
    admin
    visit new_user_session_path
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Sign in'

    visit rails_admin_path
    expect(current_path).to eql(rails_admin_path)
  end

  it "should redirect to home page and flash an error message if I'm not an admin" do
    user
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    visit rails_admin_path
    expect(current_path).to eql(root_path)
    save_and_open_page
    expect(page).to have_content("You ain't no admin")

  end

end
